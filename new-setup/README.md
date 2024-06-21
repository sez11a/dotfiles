# New Setup Readme

Before running `configure-desktop.sh`, ensure you have already run these commands in a new Arch Linux install with KDE Plasma: 

1. `sudo pacman -S git`
2. `sudo pacman -S go`
3. `cd Downloads`
4. `git clone https://aur.archlinux.org/yay.git`
5. `cd yay`
6. `makepkg -i`

This ensures `yay` is installed, which is needed for the setup script. 

Next, you want to optimize Pacman so it downloads packages from five mirrors in parallel. 

1. Edit `/etc/pacman.conf`. 
2. Add or comment in these lines: 
   ```
   Color
   ParallelDownloads = 5 
   ILoveCandy
   ```

Now your downloads should go a little faster, especially since the script enables Reflector at the beginning. 
