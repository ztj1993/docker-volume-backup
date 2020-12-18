FROM alpine:3.11

RUN apk add --no-cache dumb-init xz tar docker

COPY control /bin/control
COPY backup /bin/backup
COPY recovery /bin/recovery

RUN chmod +x /bin/control
RUN chmod +x /bin/backup
RUN chmod +x /bin/recovery

CMD /bin/control
