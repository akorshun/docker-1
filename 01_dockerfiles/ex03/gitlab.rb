external_url "https://192.168.99.107"
nginx['redirect_http_to_https'] = true
letsencrypt['enable'] = false
nginx['ssl_certificate'] = "/etc/gitlab/ssl/gitlab.bsatou.com.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/gitlab.bsatou.com.key"
gitlab_rails['gitlab_shell_ssh_port'] = 8022