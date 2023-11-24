# dotfiles
dotfiles managed with [yadm](https://yadm.io/#)

# Setup

```
proxy_host=127.0.0.1
export https_proxy="socks5://${proxy_host}:10810"
export http_proxy="http://${proxy_host}:10811"
export all_proxy="socks5://${proxy_host}:10810"
git config --global http.https://github.com.proxy socks5://${proxy_host}:10810
```

```shell
curl --create-dirs -LSso ~/.local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm
chmod u+x ~/.local/bin/yadm

~/.local/bin/yadm clone https://github.com/xba0/dotfiles.git
# ~/.local/bin/yadm remote set-url origin git@github.com:xba0/dotfiles.git

# ~/.local/bin/yadm checkout -- ~

# ~/.local/bin/yadm bootstrap

```
