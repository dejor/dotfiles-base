export EDITOR=/usr/bin/nvim

[ -e "$HOME/.config/zsh/dependencies" ] && source "$HOME/.config/zsh/dependencies"
[ -e "$HOME/.config/zsh/plugins" ] && source "$HOME/.config/zsh/plugins"
[ -e "$HOME/.config/zsh/config" ] && source "$HOME/.config/zsh/config"
[ -e "$HOME/.config/zsh/aliases" ] && source "$HOME/.config/zsh/aliases"

eval "$(starship init zsh)"
