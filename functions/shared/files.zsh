download_and_extract_repo() {
    # Check if curl is installed
    if ! command -v curl &> /dev/null; then
        echo "Error: curl is not installed."
        return 1
    fi
    
    # Check if the URL ends with .git
    if [[ "$repo_url" =~ \.git$ ]]; then
        echo "Valid Git repository URL."
    else
        echo "Invalid Git repository URL. Please provide a URL ending with .git"
        return 1
    fi
    
    
    # Extract the repository name from the URL
    local repo_url="$1"
    local repo_name="${repo_url##*/}" # Extract everything after the last '/'
    repo_name="${repo_name%.*}" # Remove .git if present
    
    # Prepare the temporary file name and the output directory
    local temp_file="/tmp/${repo_name}.tar.gz"
    
    Download the archive
    if curl -L "${repo_url}/archive/refs/heads/main.tar.gz" -o "$temp_file"; then
        echo "Downloaded ${repo_name}.tar.gz successfully."
    else
        echo "Error: Failed to download ${repo_name}.tar.gz."
        return 1
    fi
    
    # Extract the archive
    if tar -xvf "$temp_file" -C ~ --strip-components=1; then
        echo "Extracted ${repo_name}.tar.gz successfully."
    else
        echo "Error: Failed to extract ${repo_name}.tar.gz."
        return 1
    fi
}