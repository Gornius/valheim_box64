#!/bin/sh

sh download_server_files.sh
cp start_server.sh server_files

mkdir -p /root/.steam/sdk64/
cp steamcmd/linux64/steamclient.so /root/.steam/sdk64

cd server_files
sh start_server.sh
