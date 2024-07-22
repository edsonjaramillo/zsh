download_and_extract_repo() {
    # Check if curl is installed
    if ! command -v curl &> /dev/null; then
        echo "Error: curl is not installed."
        return 1
    fi
    
    # Check if the URL ends with .git
    if [[ "$1" != *".git" ]]; then
        echo "Invalid Git repository URL. Please provide a URL ending with .git"
        return 1
    fi
    
    # remove the .git extension
    local repo_url=$(echo "$1" | sed 's/\.git$//')
    
    # check to make sure second argument is not empty
    local branch="$2"
    if [[ -z "$branch" ]]; then
        echo "Error: Please provide a branch name."
        return 1
    fi
    
    # check to make sure third argument is not empty
    local output_dir="$3"
    if [[ -z "$output_dir" ]]; then
        echo "Error: Please provide an output directory."
        return 1
    fi
    
    # Extract the repository name from the URL
    local repo_name=$(basename "$repo_url" .git)
    
    # https://github.com/User/repo/archive/master.tar.gz
    local repo_tarball_url="$repo_url/archive/$branch.tar.gz"
    
    # Download the tarball and pipe it to tar
    if ! curl -L "$repo_tarball_url" | tar -xz -C "$output_dir" --strip-components=1; then
        echo "Error: Failed to download and extract the repository."
        return 1
    fi
    
    # remove the tarball
    rm -f "$output_dir/$branch.tar.gz"
}