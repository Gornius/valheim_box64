#!/bin/sh
export DEBUGGER=/usr/local/bin/box86
steamcmd/steamcmd.sh +@sSteamCmdForcePlatformType linux +force_install_dir /root/server_files +login anonymous +app_update 896660 +quit
