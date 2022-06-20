#!/bin/bash
LOG=/tmp/app.log

TOM_URL=https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.81/bin/apache-tomcat-8.5.81.tar.gz
TOM_TAR=apache-tomcat-8.5.81.tar.gz
TOM_SRC=apache-tomcat-8.5.81
TOM_WAR=tomcat/webapps/ks.war
WAR=http://192.168.29.23:8081/repository/maven-snapshots/com/ksapp/ks/8-SNAPSHOT/ks-8-20220610.142852-1.war

wget --no-check-certificate $TOM_URL  &>>$LOG

if [ $? -ne 0 ]; then
    echo "Downloading Tomact ...FAILED"
else
    echo "Downloading Tomcat ...SUCCESS"
fi

tar -xvf $TOM_TAR   &>>$LOG
if [ $? -ne 0 ]; then
    echo "Extrating Tomact ...FAILED"
else
    echo "Extrating Tomcat ...SUCCESS"
fi

mv $TOM_SRC tomcat  
if [ $? -ne 0 ]; then
    echo "Re-naming to Tomcat  ...FAILED"
else
    echo "Re-naming to Tomcat  ...SUCCESS"
fi

cd tomcat/webapps && rm -rf *;
if [ $? -ne 0 ]; then
    echo "Clearing WebApps  ...FAILED"
else
    echo "Clearing WebApps  ...SUCCESS"
fi
