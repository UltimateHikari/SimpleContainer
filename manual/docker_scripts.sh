docker build . -t netwtest
docker run --privileged -it --name="manual$1" netwtest
