proxy_host=${proxy_host:-localhost}

# set proxy
function v2() {
  export https_proxy="socks5://${proxy_host}:10810"
  export http_proxy="http://${proxy_host}:10811"
  export all_proxy="socks5://${proxy_host}:10810"
  git config --global http.https://github.com.proxy socks5://${proxy_host}:10810
  echo ok
}

function nov2() {
  export https_proxy=
  export http_proxy=
  export all_proxy=
  git config --unset --global http.https://github.com.proxy
}

