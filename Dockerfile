FROM ubuntu:mantic

USER root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y openssh-server git

# Set up configuration for SSH
#RUN mkdir /var/run/sshd
RUN useradd -m git
RUN echo 'git:git' | chpasswd
RUN echo 'root:secret_password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise, user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Prepare remote repository
USER git
RUN mkdir /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys
RUN mkdir /home/git/repository
RUN mkdir /home/git/repository/default.git

RUN chmod 0700 /home/git
RUN chmod 0700 /home/git/.ssh
RUN chmod 0700 /home/git/.ssh/authorized_keys

USER root
RUN ln -s /home/git/repository /repository
RUN chown -R git:git /repository

USER git
WORKDIR /repository/default.git
RUN git init --bare

USER root
WORKDIR /root
COPY scripts /root/scripts
RUN chmod +x /root/scripts/*.sh

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]