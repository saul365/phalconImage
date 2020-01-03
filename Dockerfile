FROM ubuntu:18.04
COPY ./* /root/
RUN bash ~/pre.bash
