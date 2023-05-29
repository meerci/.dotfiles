# .dotfiles
My dotfiles

## Usage

### install
```bash
git clone https://github.com/xba0/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./uninstall && ./install

# discard local version
git reset --hard
# or save local version
git stash
```

### uninstall
```bash
cd ~/.dotfiles
./uninstall
```

### manage links
```
vim ~/.dotfiles/links

# example
echo manage ~/.bashrc >> ~/.dotfiles/links
```
