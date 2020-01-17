# Git branch
function git_branch {
  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null);
  if [[ -n $branch ]];then
    echo "($branch) ";
  fi
}

# Backup
function backup-file() {
    cp -r "$1"{,.bak};
    #cp $1 $1_`date +%H:%M:%S_%d-%m-%Y`
}

# Compress
function compress() {
	case "$1" in
		7z|.7z) 7z a "${2}.7z" "$2";;
		gz|.gz) gzip -r -v "$2";;
		tar|.tar) tar -cvf "${2%%/}.tar" "${2%%/}/";;
		tar.gz|tar.gz) tar -cvfz "${2%%/}.tar.gz" "${2%%/}/";;
		zip|.zip) zip -r -9 "${2}.zip" "$2";;
		*)
		echo "Usage: compress <archive type> <filename>"
		echo "Supported archive type: 7z, gz, tar, tar.gz, zip";;
	esac
}

# Extract
function extract() {
	case "$1" in
		*.7z) mkdir -v "$2" 2>/dev/null; 7z x "$1" -d "$2";;
		*.gz) gunzip "$1";;
		*.tar) mkdir -v "$2" 2>/dev/null; tar -xvf "$1" -C "$2";;
		*.tar.gz|*.tgz) mkdir -v "$2" 2>/dev/null; tar -xvfz "$1" -C "$2";;
		*.zip) mkdir -v "$2" 2>/dev/null; unzip "$1" -d "$2";;
		*)
		echo "Usage: extract <archive> <destination>"
		echo "Supported archive type: 7z, gz, tar, tar.gz, zip";;
	esac
}

# This should be the last line of the file
# For local changes
# Don't make edits below this
[ -f "$DOTFILES_PATH/bash/.bash_functions.local" ] && source "$DOTFILES_PATH/.bash_functions.local"
