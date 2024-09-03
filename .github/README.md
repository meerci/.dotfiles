# dotfiles
dotfiles managed with [yadm](https://yadm.io/#)

# Setup

```shell
curl --create-dirs -LSso ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod u+x ~/.local/bin/yadm

~/.local/bin/yadm clone https://github.com/xba0/dotfiles.git
# ~/.local/bin/yadm remote set-url origin git@github.com:xba0/dotfiles.git
# ~/.local/bin/yadm checkout -- ~
# ~/.local/bin/yadm bootstrap

```
