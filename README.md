# dotfiles
dotfiles managed with [yadm](https://yadm.io/#)

# Setup

```shell
curl --create-dirs -LSso ~/.local/bin/yadm -x socks5://127.0.0.1:10810  https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod u+x ~/.local/bin/yadm
~/.local/bin/yadm clone -c https.proxy="127.0.0.1:10810" https://github.com/xba0/dotfiles.git
~/.local/bin/yadm restore --staged ~
~/.local/bin/yadm checkout -- ~
~/.local/bin/yadm bootstrap
```
