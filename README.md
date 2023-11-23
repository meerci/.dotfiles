# .dotfiles

My dotfiles

## Usage

### install
```bash
git -c https.proxy="127.0.0.1:10810" clone https://github.com/xba0/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./uninstall && ./install
# git remote set-url origin git@github.com:xba0/dotfiles.git

```

### uninstall
```bash
cd ~/.dotfiles
./uninstall
```

### manage symbolic links
```bash
vim ~/.dotfiles/links

# example
echo manage ~/.bashrc >> ~/.dotfiles/links
```
