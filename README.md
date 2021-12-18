# docker-dymola
Docker image for Dymola. This enables using Dymola GUI on a macOS machine.

## build and tag dymola image 
cd ./2019FD/
make build
make tag

## install dependency on MacOS
brew install socat 
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.zshr
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
brew install --cask xquartz

## run dymola docker and forward GUI through xhost
open -a XQuartz
xhost + $(hostname)
docker run --rm -it -e DISPLAY=$(hostname):0 yangyangfu/dymola:2019