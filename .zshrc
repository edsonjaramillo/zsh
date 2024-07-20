# source all files in zshrc.d
for file in ~/zshrc.d/*; do
    source $file
done