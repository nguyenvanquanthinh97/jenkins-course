FROM centos:7

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "1234" | passwd remote_user --stdin && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key-pem.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

# ssh need to create global key
# This is required to open ssh server in Docker container
RUN /usr/sbin/sshd-keygen

# install mysql client
RUN yum install mysql -y

# install aws client by pip
RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
    python get-pip.py && \
    pip install awscli --upgrade

# command to start ssh server
CMD /usr/sbin/sshd -D

