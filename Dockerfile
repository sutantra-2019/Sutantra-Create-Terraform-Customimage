FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Pacific

RUN apt-get update -y \
    && apt-get install -y tzdata \
    && apt-get install awscli -y \
    && apt-get install wget -y \
    && apt-get install unzip -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update -y \
    && apt-get install python3 -y \
    && apt-get install python3-pip -y \
    && pip3 install boto3 --user \
    && pip3 install bs4 \
    && pip3 install requests \
    && pip3 install ConfigParser

ARG Terraform_Version

RUN wget --quiet https://releases.hashicorp.com/terraform/${Terraform_Version}/terraform_${Terraform_Version}_linux_amd64.zip \
  && unzip terraform_${Terraform_Version}_linux_amd64.zip \
  && mv terraform /usr/local/bin \
  && rm terraform_${Terraform_Version}_linux_amd64.zip
