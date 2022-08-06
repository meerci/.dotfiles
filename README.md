# .dotfiles
My dotfiles

## Usage

### install
```bash
git clone git@github.com:xba0/.dotfiles.git
cd ~/.dotfiles
./uninstall && ./install
# discard local version
git reset --hard
# or save local version
git commit -a -m "tmp"
git reset HEAD^
```

### uninstall
```bash
cd ~/.dotfiles
./uninstall && ./install
```

### add config to manage
```
vim ~/.dotfiles/links
```
