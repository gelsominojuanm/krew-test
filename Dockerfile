FROM ubuntu:latest

# Instalar kubectl
RUN  apt-get update
RUN apt-get install -y apt-transport-https ca-certificates curl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl
RUN apt-get install -y git

COPY . .
# Instalar Krew
RUN ./script-krew.sh

# Instalar Python y Flask
RUN apt-get install -y python3
RUN apt-get install -y pip
RUN pip install flask
