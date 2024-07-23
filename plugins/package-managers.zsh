# add npm to path if homebrew is installed
if [[ -d /opt/homebrew ]]; then
    node_version=$(ls /opt/homebrew/opt/ | grep node@)
    export PATH="/opt/homebrew/opt/$node_version/bin:$PATH"
fi