function arpscan() {
arp -a | grep -v "incomplete" | awk '{print $2, $4}' | tr -d '()'
}

function extract () {
if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2) tar xjf $1 ;;
        *.tar.gz)  tar xzf $1 ;;
        *.tar.xz)  tar xJf $1 ;;
        *.zip)     unzip $1 ;;
        *.7z)      7z x $1 ;;
        *) echo "'$1' cannot be extracted via ex()" ;;
    esac
else
    echo "'$1' is not a valid file"
fi
}
