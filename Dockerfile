FROM caliahub/jdk:1.8.0_101

MAINTAINER Calia "cnboycalia@gmail.com"

ENV PATH=$PATH:/usr/local/docker

COPY jenkins-agent /usr/local/bin/jenkins-agent

RUN apk add --update --no-cache curl bash git git-lfs openssh-client openssl procps \
  && curl --create-dirs -fsSLo /usr/share/jenkins/agent.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/4.3/remoting-4.3.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/agent.jar \
  && mkdir -p /home/jenkins/master \
  && cd /usr/local \
  && wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.0.tgz \
  && tar zxf docker-19.03.0.tgz \
  && rm -rf docker-19.03.0.tgz 

WORKDIR /home/jenkins

ENTRYPOINT ["jenkins-agent"]
