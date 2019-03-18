#FROM nginx

#RUN apt-get update && apt-get install git -y
#RUN echo "Hello World!"

FROM ubuntu:16.04

# Install basic software support
RUN apt-get update && \
    apt-get install --yes software-properties-common

# Add the JDK 8 and accept licenses (mandatory)
RUN add-apt-repository ppa:webupd8team/java && \
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Install Java 8
RUN apt-get update && \
    apt-get --yes --no-install-recommends install oracle-java8-installer
RUN apt-get update && apt-get install -y maven

# Jetty/Tomcat port
# EXPOSE 8081

FROM tomcat

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

EXPOSE 8080



