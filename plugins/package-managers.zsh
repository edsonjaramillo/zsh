# add npm to path if homebrew is installed
if [[ -d /opt/homebrew ]]; then
    node_version=$(ls /opt/homebrew/opt/node@* | sort -V | tail -n 1)
    export PATH="/opt/homebrew/opt/node@${node_version}/bin:$PATH"
fi