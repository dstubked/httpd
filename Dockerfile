FROM centos:latest
RUN yum -y install httpd
COPY index.html /var/www/html/
ADD microenforcer /bin/microenforcer
ADD policy.json /etc/aquasec/policy/policy.json
ADD firewall.json /etc/aquasec/policy/firewall.json
EXPOSE 80
ENTRYPOINT ["/bin/microenforcer", "/usr/sbin/httpd", "-D", "FOREGROUND"]
