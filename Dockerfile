FROM mcr.microsoft.com/azure-functions/python:4-python3.11-appservice

RUN apt-get update && \
    apt upgrade -y && \
    apt-get install -y build-essential python3-pip python3-setuptools python3-wheel python3-cffi libcairo2 libpango-1.0-0 libpangoft2-1.0-0 \
      libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info fonts-liberation fonts-dejavu-core && \
    rm -rf /var/lib/apt/lists/*

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /home/site/wwwroot
