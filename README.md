Drug Farming Script for FiveM
This script adds drug farming zones and items for a FiveM server using the ox_lib, ox_target, and ox_inventory dependencies.

Features
Spawn zones for cocaine, weed, mushrooms, and poppies

Collectible props and items configured with spawn counts

Uses animations for planting/collecting

Compatible with ox_lib, ox_target, and ox_inventory

Dependencies
Make sure you have these resources installed and started on your server before using this script:

ox_lib

ox_target

ox_inventory

Installation
Download or clone this repository into your server resources folder.

Ensure the dependencies (ox_lib, ox_target, ox_inventory) are installed and started.

Add this script to your server.cfg:

sql
Copy
start ox_lib
start ox_target
start ox_inventory
start your_script_name
Configure zones, items, and other settings inside the script as needed.

Configuration
Drug zones and spawn settings are defined in the Config table.

Item names and labels can be customized.

Animation and cooldown times can be adjusted for gameplay balance.

Usage
Players can harvest plants in the configured zones and receive the corresponding items in their inventory.

License
MIT License

