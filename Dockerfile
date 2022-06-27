FROM centos:7
LABEL IMGOWNER="kartikeyait@gmail.com"
ARG USERNAME=tomuser
ARG GROUP=tomuser
ENV WAR_PACK=/usr/src/app/tomcat/webapps/ks.war
ARG TOM_HOME=/usr/src/app/tomcat/
ENV TOM_START=/usr/src/app/tomcat/bin/catalina.sh
ARG UID=1001
ARG GID=1001
RUN groupadd -g $GID -o $USERNAME
RUN useradd -u $UID -g $GID -o -s /bin/bash $USERNAME
WORKDIR /usr/src/app
RUN yum install wget update java -y
COPY shell.sh .
RUN chmod +x shell.sh
RUN sh shell.sh
ADD https://ksprod.s3.amazonaws.com/ks-pro.war ${WAR_PACK}
RUN chown ${USERNAME}:${USERNAME} ${TOM_HOME} -R
EXPOSE 8080
USER ${USERNAME}
CMD sh ${TOM_START} run