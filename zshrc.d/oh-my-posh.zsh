# if os is linux add /usr/.local/bin to path
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi