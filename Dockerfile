FROM maven:3.8.6-openjdk-11-slim

LABEL building_block="node-maven-selenium"
LABEL version="1.0.0"

ARG CHROMEDRIVER_VERSION=108.0.5359.71
ARG WORK_DIR=/home/userTest/project

# Update image and install dependencies
RUN apt-get update && apt-get upgrade -y

# Configure chromedriver for Selenium
RUN apt-get install wget unzip -y
RUN wget https://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mkdir /opt/selenium
RUN mv chromedriver /opt/selenium

# Install Chromium
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install ./google-chrome*.deb -y
RUN export CHROME_BIN=/usr/bin/google-chrome
RUN sed -i 's/"$HERE\/chrome"/"$HERE\/chrome" --window-size=1920,1080 --no-sandbox --headless/g' /opt/google/chrome/google-chrome

# Install nodejs
RUN apt-get install curl -y
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm
RUN npm i yarn -g