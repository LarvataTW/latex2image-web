FROM blang/latex:ubuntu
WORKDIR /src
RUN apt-get update -q 
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash - 

# RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs
#RUN  apt-get update &&  apt-get install -y ca-certificates curl gnupg
#RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
#RUN NODE_MAJOR=18
# RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
# RUN echo " https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
#RUN  apt-get update &&  apt-get install nodejs -y
# # Install Node.js
# RUN apt-get install --yes curl
# RUN curl --silent --location https://deb.nodesource.com/setup_4.x | sudo bash -
# RUN apt-get install --yes nodejs
# RUN apt-get install --yes build-essential
# WORKDIR /src
COPY ./package.json /src/package.json  
COPY ./package-lock.json /src/package-lock.json 
RUN  npm install
COPY . /src
# RUN cd /src; npm install
EXPOSE 3001 
ENV NODE_ENV production
CMD ["node", "/src/app.js"]