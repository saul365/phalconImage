FROM ubuntu:18.04
COPY dockerInstall.sh /root/
RUN bash ~/dockerInstall.sh
