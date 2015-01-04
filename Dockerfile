FROM centos:centos7
MAINTAINER Minoru Murata <minoru.murata@gmail.com>

ENV HOME /root

RUN yum -y update

RUN yum install openldap

EXPOSE 389
EXPOSE 636

VOLUME /var/lib/ldap
VOLUME /etc/ssl

ENTRYPOINT /usr/sbin/slapd -h 'ldap:/// ldapi:/// ldaps:///' -F /etc/ldapslapd.d -d 256

