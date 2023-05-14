# STATUS: WORKING AS OF 2023-05-14! (Tested @ Ampere AARCH64 CPU)

# Valheim server for AARCH64 (ARM64) working thorugh Box64

This docker image aims to allow running Valheim Dedicated Server on AARCH64 architecture through Box64 emulator with minimal configuration required.

## Usage
Use included example docker-compose.yml. All of the environment variables are self-explanatory. Remember to forward ports 2456 and 2457 on your router.

If you've changed what you wanted, simply run the project through `docker compose up -d`

Directory `server_data` exposes some useful files from AppData directory, including `adminlist.txt`, `permittedlist.txt`, `bannedlist.txt` as well as worlds_local directory, where you can put your world files.

If you wish to add yourself as admin, find your steamid and put it in `adminlist.txt`

## Customizing meta-info
If you want to change server name, password, world name etc., copy `.env.example` as `.env` and change data here.
