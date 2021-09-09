FROM docker:latest

COPY bin/ /bin/

RUN chmod +x /bin/batch \
 && chmod +x /bin/control \
 && chmod +x /bin/backup \
 && chmod +x /bin/recovery

CMD /bin/control
