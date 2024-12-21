FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y docker.io
RUN apt-get update && apt-get install -y passwd
# after the epiphany
RUN usermod -aG docker jenkins 
USER jenkins