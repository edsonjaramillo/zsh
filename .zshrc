# source all files in zshrc.d
for file in ~/zshrc.d/*; do
    source $file
done

# if os is linux add /usr/.local/bin to path
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi