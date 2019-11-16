FROM debian

LABEL maintainer="bsatou@student.21-school.ru"

EXPOSE 443 80 22

RUN apt update && \
    apt upgrade -y && \
    apt install -y ca-certificates openssl openssh-server wget postfix && \
    wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && chmod 777 script.deb.sh && ./script.deb.sh && apt install -y gitlab-ce && \
    apt update && apt install -y tzdata && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir -p /etc/gitlab/ssl && \
    chmod 700 /etc/gitlab/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/gitlab/ssl/gitlab.bsatou.com.key -out /etc/gitlab/ssl/gitlab.bsatou.com.crt -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=gitlab.bsatou.com" && \
    chmod 600 /etc/gitlab/ssl/gitlab.bsatou.com.* && \
    echo "external_url "https://gitlab.bsatou.com"" >> /etc/gitlab/gitlab.rb && \
    echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb && \
    echo "letsencrypt['enable'] = false" >> /etc/gitlab/gitlab.rb && \
    echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/gitlab.bsatou.com.crt\"" >> /etc/gitlab/gitlab.rb && \
    echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/gitlab.bsatou.com.key\"" >> /etc/gitlab/gitlab.rb && \
    echo "gitlab_rails['gitlab_shell_ssh_port'] = 8022" >> /etc/gitlab/gitlab.rb

CMD service ssh start && (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && gitlab-ctl tail

# git clone or git push with HTTPS add 'GIT_SSL_NO_VERIFY=true' at the begining of each commands like '$ GIT_SSL_NO_VERIFY=true git push'
# git push with https://* in directory do '$ git config http.emptyAuth true' to avoid HTTP error if you get one