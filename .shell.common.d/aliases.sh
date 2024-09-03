alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias md5='openssl md5'
alias sha1='openssl sha1'
alias sha256='openssl sha256'


alias mkdir='mkdir -pv'

alias fnvim='nvim $(fzf --height 40% --border)'
alias fn=fnvim
alias fcd='cd $(find * -type d | fzf --height 40% --border)'

alias pxinstall='pip install --break-system-packages'

alias v="nvim"
