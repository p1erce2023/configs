parse_git_branch() {
  git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(parse_git_branch)\$ '

Find PS1 and remove \u@\h: for username and hostname. Replace \w with \W to only last pathname (not recommend).

makeoldpath() {
    if [ -z "$1" ]; then
        echo "Usage: makeoldpath <directory>"
        return 1
    fi

    local dir="$1"

    if [ ! -d "$dir" ]; then
        echo "Error: $dir is not a directory."
        return 1
    fi

    # Set nice level to -9 for the whole process
    renice -n 9 $$ > /dev/null

    # Loop over all files in the directory
    for file in "$dir"/*; do
        # Check if the file is already makeold-ed and gzipped
        if [[ "$file" == *.old_*.gz ]]; then
            continue
        fi

        # Check if the file is currently being written to by another process
        if lsof "$file" > /dev/null 2>&1; then
            echo "Skipping $file as it is currently being written to."
            continue
        fi

        # Perform the makeold operation
        local timestamp=$(date +"%Y%m%d%H%M%S")
        local newfile="${file}.old_${timestamp}"

        # Copy the file with the new name and clear the original
        mv "$file" "$newfile"
        echo "process $file"

        # Gzip the new file
        gzip "$newfile"
    done
}

# Force grep to always use color
alias grep='grep --color=always'

# Make less interpret colors by default
alias less='less -R'
