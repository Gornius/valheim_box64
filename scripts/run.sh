#!/bin/sh

sh download_server_files.sh
cp start_server.sh server_files

cd server_files
sh start_server.sh
