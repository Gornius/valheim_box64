# Valheim server for AARCH64 (ARM64) working thorugh Box64

This docker image aims to allow running Valheim Dedicated Server on AARCH64 architecture through Box64 emulator with minimal configuration required.

## Usage
Use included example docker-compose.yml. All of the environment variables are self-explanatory. Remember to forward ports 2456 and 2457 on your router.

If you've changed what you wanted, simply run the project through `docker compose up -d`

## Chaning port
If you change port variable, remember to also change port mapping in docker-compose.yml.
