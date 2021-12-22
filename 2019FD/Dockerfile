FROM ubuntu:20.04

# Dymola Version
ENV DYMOLA_VERSION 2019
ENV DYMOLA_DISTRIBUTION 2

# Disable tzdata interactive configuration
ENV DEBIAN_FRONTEND noninteractiv

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y sudo 

# Dependencies not automatically installed
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:linuxuprising/libpng12 && \
    apt-get update && \
    apt-get install -y libjpeg62 libpng12-0 \
    libglu1-mesa libxkbcommon0 \
    libice-dev libfreetype6 libxcomposite-dev libfontconfig libasound2 \
    libxcursor-dev libxdamage1 libxi6 libgconf-2-4 libegl-dev xterm alien

# X Forwarding
# Replace 1000 with your user / group id (and down below)
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

ENV HOME /home/developer

# Copy installation files & license
COPY installer/AM_CAT_Dymola.Linux64/1/linux_x86_64 ${HOME}/dymola-rpms
COPY license/dymola.lic ${HOME}/.dassaultsystemes/dymola/dymola.lic

# Convert rpm package to deb
RUN cd ${HOME}/dymola-rpms && \
    alien -ik dymola-${DYMOLA_VERSION}.${DYMOLA_DISTRIBUTION}-1.x86_64.rpm 

# Rename bash
RUN cd /usr/local/bin && \
    mv dymola* dymola

# Create a folder for MODELICAPATH so that we mount dependency from local 
WORKDIR ${HOME}
RUN mkdir modelica_path 
ENV MODELICAPATH ${HOME}/modelica_path

# Clean folder
WORKDIR ${HOME}
RUN rm -rf dymola-rpms

USER developer

CMD [ "/bin/bash" ]