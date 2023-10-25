FROM ubuntu:lunar
RUN apt update
RUN apt install -y rnp
RUN apt clean

WORKDIR /root
COPY scripts/entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]