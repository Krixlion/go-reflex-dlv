FROM golang:1.19.3

RUN go install github.com/cespare/reflex@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

COPY reflex.conf /usr/local/etc/
COPY build.sh /usr/local/bin/

WORKDIR /app

VOLUME /go

EXPOSE 2345

CMD ["reflex", "-d", "none", "-c", "/usr/local/etc/reflex.conf"]
