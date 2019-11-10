FROM debian

LABEL maintainer="bsatou@student.21-school.ru"

EXPOSE 443 80 22

RUN apt update && \
    apt upgrade -y && \
    apt install -y ca-certificates openssh-server wget postfix && \
    wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && chmod 777 script.deb.sh && ./script.deb.sh && apt install -y gitlab-ce && \
    apt update && apt install -y tzdata && \
    apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD (/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure && tail -f /dev/null