FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y \
    wget \
    nodejs \
    npm

# powershell
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.6/powershell_7.4.6-1.deb_amd64.deb
RUN dpkg -i powershell_7.4.6-1.deb_amd64.deb || apt-get install -f -y
RUN rm -f powershell_7.4.6-1.deb_amd64.deb

# Pester
RUN pwsh -Command "Install-Module -Name Pester -Force"

WORKDIR /tests
COPY . /tests

CMD ["pwsh", "-File", "/tests/invoke.ps1"]
