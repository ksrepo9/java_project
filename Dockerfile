FROM centos:7
LABEL maintainer="kartikeyait@gmail.com"
ARG USERNAME=tomuser
ARG GROUP=tomuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $USERNAME
RUN useradd -u $UID -g $GID -o -s /bin/bash $USERNAME
ARG TOM_SRC=/opt/apache-tomcat-8.0.32
ENV TOM_SRC1=/opt/apache-tomcat-8.0.32
ARG WAR_PACK=/opt/apache-tomcat-8.0.32/webapps/ks.war
ADD apache-tomcat-8.0.32.tar.gz /opt/
RUN set -eux; \
    yum install java-1.8.0-openjdk -y; \
    cd ${TOM_SRC}/webapps && rm -rf *;
ADD http://192.168.29.23:8081/repository/maven-snapshots/com/ksapp/ks/8-SNAPSHOT/ks-8-20220610.142852-1.war /${WAR_PACK}
RUN chown $USERNAME:$USERNAME $TOM_SRC -R
EXPOSE 8080
USER $USERNAME
ENTRYPOINT sh /${TOM_SRC1}/bin/catalina.sh run

