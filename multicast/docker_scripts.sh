docker build . -t netwtest
docker run --privileged -it --name="multicast$1" netwtest
