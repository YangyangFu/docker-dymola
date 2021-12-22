open -a XQuartz && \
xhost + $(hostname) && \
docker run --rm -it -v `pwd`:/mnt/shared -e DISPLAY=$(hostname):0 yangyangfu/dymola:2019 /bin/bash -c \
"cd /mnt/shared && dymola test.mo"