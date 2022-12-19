FROM debian

WORKDIR /app

# Install deps
RUN \
dpkg --add-architecture armhf;\
apt-get update && apt-get install -y curl libc6:armhf vim git cmake python3 gcc-arm-linux-gnueabihf;

WORKDIR /root
# Install box86
RUN \
git clone https://github.com/ptitSeb/box86 --branch v0.2.8;\
cd box86;\
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;\
make -j2;\
make install

# Install steamcmd
RUN \
mkdir steamcmd && cd steamcmd;\
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;

# Install box64
RUN \
git clone https://github.com/ptitSeb/box64 --branch v0.2.0;\
cd box64;\
mkdir build; cd build; cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;\
make -j2;\
make install

# Clean up build process
RUN \
rm -rf /root/box64 /root/box86;\
apt-get autoremove --purge -y curl vim git cmake python3 gcc-arm-linux-gnueabihf 


ADD scripts /root

EXPOSE 2456-2457/udp

CMD [ "/bin/sh", "run.sh"]
