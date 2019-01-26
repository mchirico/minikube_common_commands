FROM ubuntu

RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server 

RUN mkdir /var/run/sshd
RUN mkdir /data
RUN echo 'root:PoppyDoc29' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

# docker build -t us.gcr.io/mchirico/ssh:pub .
# docker run -p 8022:22 --rm -it  us.gcr.io/mchirico/ssh:pub

# kubectl run -i --tty ssh --image=us.gcr.io/mchirico/ssh:pub -- /bin/bash

