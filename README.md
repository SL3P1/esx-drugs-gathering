# Drug Farming Script for FiveM

This script adds drug farming zones and collectible items for a FiveM server.  
It supports cocaine, weed, mushrooms, and poppies with configurable spawn zones and counts.

## Features

- Spawn zones for multiple drugs with props and items  
- Configurable spawn counts and zones  
- Animations for planting and collecting  
- Compatible with ox_lib, ox_target, and ox_inventory  

## Dependencies

Make sure these resources are installed and running on your server:

- [ox_lib](https://github.com/overextended/ox_lib)  
- [ox_target](https://github.com/overextended/ox_target)  
- [ox_inventory](https://github.com/overextended/ox_inventory)  

## Installation

1. Clone or download this repository into your server’s `resources` folder.  
2. Ensure dependencies (`ox_lib`, `ox_target`, `ox_inventory`) are installed and started.  
3. Add to your `server.cfg`:

    ```
    start ox_lib
    start ox_target
    start ox_inventory
    start your_script_name
    ```

4. Configure spawn zones, items, and other settings inside the script as needed.

## Usage

Players can harvest plants in designated zones and collect corresponding items.

## Tracking Downloads

You can track how many people download this script by publishing release versions:  

- Upload a packaged ZIP file in the **Releases** section of this repository.  
- GitHub provides download counts for each release asset.  
- Check **Insights → Traffic** for repository visit and clone stats.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Feel free to open issues or submit pull requests!

