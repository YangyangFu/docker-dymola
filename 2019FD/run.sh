open -a XQuartz && xhost + $(hostname) && \
docker run --rm -it -e DISPLAY=$(hostname):0 yangyangfu/dymola:2019