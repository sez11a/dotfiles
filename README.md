# Dotfiles

My personal configuration. If you want a desktop like mine and an installed system set up the way I work, this repository is for you. Here's the way this works: 

1. Install a supported OS, preferably with a KDE Plasma desktop. Currently supported are [OpenMandriva](https://www.openmandriva.org), [Arch (and derivatives)](https://www.archlinux.org), and [Fedora](https://www.fedoraproject.org/kde/). Debian has minimal (i.e., CLI-only) support. 

2. After you've rebooted into your newly installed system, make sure Git is installed. In other words, if it wasn't installed by default, install it. 

3. Run this command: 

   ```bash 
   curl -sLf https://raw.githubusercontent.com/sez11a/dotfiles/master/install-dotfiles.sh | bash 
   ```

   NOTE: I trust me, but you shouldn't trust me unless you know me. I don't require you to run the script above with `sudo`, but it will launch an installation routine that requires `sudo` (you'll get the choice to quit first). Never run scripts from the Internet before examining them to make sure they aren't doing anything nefarious. 

Make sure you have a good Internet connection; this installation routine will download a lot of packages from the distros' repositories. 

Enjoy! 
