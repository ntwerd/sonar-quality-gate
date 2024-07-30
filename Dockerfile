FROM sonarsource/sonar-scanner-cli:5.0.1

RUN apk add --update nodejs npm

ENV WORKDIR=/app

RUN mkdir /app/
COPY . /app/
WORKDIR /app

RUN npm install
RUN npm run build
RUN npm i -g
RUN rm -rf src

ENV SONAR_HOST_URL="https://sonarqube.erddev.xyz"

CMD sonar-scanner