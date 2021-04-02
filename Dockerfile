FROM golang:1.12-alpine
RUN apk add --no-cache git
RUN git clone https://github.com/NipoDB/nipo.git /tmp/NipoDB
RUN go get github.com/NipoDB/nipolib
RUN go get gopkg.in/yaml.v2
WORKDIR  /tmp/NipoDB/nipo
RUN go build
RUN mkdir -p /etc/nipo
COPY ./files/config/nipo-cfg.yaml /etc/nipo/
RUN mkdir -p  /var/log/nipo
RUN touch /var/log/nipo/nipo.log
EXPOSE 2323
ENTRYPOINT ["/tmp/NipoDB/nipo/nipo" , "/etc/nipo/nipo-cfg.yaml"]
