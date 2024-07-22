# source all plugins from $HOME/zshrc.shared.d/plugins
for file in $HOME/zshrc.shared.d/plugins/*; do
    source $file
done