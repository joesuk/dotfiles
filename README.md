Adapted from [LARBS](https://larbs.xyz).

- Everything is for Arch/Artix Linux.
- Useful scripts are in `~/.local/bin/`
- Settings for:
	- vim/nvim (text editor)
	- neomutt (email)
	- zsh (shell)
	- lf (file manager)
	- mpd/ncmpcpp (music)
	- sxiv (image/gif viewer)
	- mpv (video player)
	- [my mod of dwm](https://github.com/joesuk/dwm) (window manager)
	- [Luke Smith mod of dwmblocks](https://github.com/lukesmithxyz/dwmblocks) (statusbar)
	- [my mod of st](https://github.com/lukesmithxyz/st) (terminal emulator)
	- other stuff like xdg default programs, inputrc and more, etc.
- I try to minimize what's directly in `~` so:
	- All configs that can be in `~/.config/` are.
	- Some environmental variables have been set in `~/.zprofile` to move configs into `~/.config/`
- Bookmarks in text files used by various scripts (like `~/.local/bin/shortcuts`)
	- File bookmarks in `~/.config/shell/bm-files`
	- Directory bookmarks in `~/.config/shell/bm-dirs`

## Install these dotfiles and all dependencies

Use [`bootstrap/install.sh`](https://github.com/joesuk/dotfiles/blob/master/bootstrap/install.sh) to autoinstall everything:

```
curl -LO https://raw.githubusercontent.com/joesuk/dotfiles/master/bootstrap/install.sh
```
or clone the repo files directly to your home directory and install the
[dependencies](https://github.com/joesuk/dotfiles/blob/master/bootstrap/progs.csv).
