#navigation
alias ..='cd ..'
alias d='ls -hl --sort=extension --time-style=long-iso --group-directories-first'
alias da='d -a'
alias ...='.. && d'
cdd() {
    cd $1 && d
    }
alias tree='tree -aC'

#system
alias lprocess='pgrep -l .'
alias fprocess='pgrep -l'
alias lspart='lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'

#pacman
alias getapp='sudo pacman -S'
alias rmapp='sudo pacman -Rs'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Suuy'
alias findapp='pacman -Ss'
alias ihasapp='pacman -Qs'
alias lsupdates='pacman -Qu'

#cp commands
alias cpr='cp -ivR'

#rm
alias rmr='sudo rm -Ivrf'

#alias commands
alias aliasedit='$EDITOR ~/.bash_aliases && source ~/.bash_aliases'

#tar
alias mktgz='tar -zcvf'
alias untgz='tar -zxvf'
alias untar='tar -xf'

#git 
alias gcm='git commit'
alias gcma='git commit --all'
alias gcl='git clone'
alias gdiff='git diff'

alias gps='git push'
alias gpl='git pull'

alias gadd='git add'
alias gst='git status'

#user
alias lgroup='cat /etc/group'
alias fgroup='cat /etc/group | grep '

#prog
alias pyinstall='sudo pip install'
alias py='python'
alias pdb='python -m pdb'
alias mkenv='virtualenv venv'
alias activatenv='source venv/bin/activate'
alias jv='java -jar'
alias fuck='eval $(thefuck $(fc -ln -1))'

getheaderloc () {
    str=$1
    if [ $str != "" ]; then
        echo "#include <$str>" | gcc -E -x c - | grep $str
    fi
}

