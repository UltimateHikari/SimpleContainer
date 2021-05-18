FROM debian
RUN apt update & apt install tcpdump vim curl
ADD scripts simpleHTTP.jar /
