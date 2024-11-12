FROM debian:12.4-slim

WORKDIR /app

# Install deps
RUN \
dpkg --add-architecture armhf;\
apt-get update && apt-get install -y curl libc6:armhf vim git cmake python3 gcc-arm-linux-gnueabihf;

WORKDIR /root
# Install box86
RUN \
git clone https://github.com/ptitSeb/box86;\
cd box86;\
mkdir build; cd build; cmake .. -DARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo;\
make -j$(nproc);\
make install

# Install steamcmd
RUN \
mkdir steamcmd && cd steamcmd;\
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -;

# Install box64
RUN \
git clone https://github.com/ptitSeb/box64;\
cd box64;\
mkdir build; cd build; cmake .. -DARM_DYNAREC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo;\
make -j$(nproc);\
make install

# Clean up build process
RUN \
rm -rf /root/box64 /root/box86;\
apt-get autoremove --purge -y curl vim git cmake python3 gcc-arm-linux-gnueabihf 


ADD scripts /root

EXPOSE 2456-2458/udp

CMD [ "/bin/sh", "run.sh"]
