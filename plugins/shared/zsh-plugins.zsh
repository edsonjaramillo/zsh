# install zsh-autosuggestions if not installed
if [ ! -f "$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
else
    source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# install zsh-syntax-highlighting if not installed
if [ ! -f "$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
else
    source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# install git.plugin.zsh if not installed
if [ ! -f "$HOME/.zsh/git.plugin.zsh" ]; then
    curl -o $HOME/.zsh/git.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh
    source $HOME/.zsh/git.plugin.zsh
else
    source $HOME/.zsh/git.plugin.zsh
fi
