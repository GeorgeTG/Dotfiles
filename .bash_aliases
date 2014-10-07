#navigation
alias ..='cd ..'
alias d='ls -hl --sort=extension --time-style=long-iso --group-directories-first'
alias da='d -a'
alias ...='.. && d'
cdd() {
    cd $1 && d
    }
alias tree='tree -aC'
alias cdvenv='cd $VIRTUAL_ENV' #change directory to current virtual env.

#system
alias lprocess='pgrep -l .'
alias fprocess='pgrep -l'
alias lspart='sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL'
#apt
alias getapp='sudo apt-get install'
alias update='sudo apt-get update; sudo apt-get upgrade'
alias dupdate='sudo apt-get update; sudo apt-get dist-upgrade'

#cp commands
alias cpr='cp -ivR'
alias sdcp='sudo cp -iv'
alias sdcpr='sudo cp -ivR'

#rm
alias rmr='sudo rm -Ivrf'

#alias commands
alias aliasedit='vim ~/.bash_aliases'
alias aliassource='source ~/.bashrc'

#tar
alias mktgz='tar -zcvf'
alias untgz='tar -zxvf'

#git 
alias gi='git init'

alias gc='git commit -m'
alias gca='git commit -a -m'
alias gcl='git clone'

alias gps='git push'
alias gpsum='git push -u origin master'
alias gpl='git pull'

alias gradd='git remote add origin'
alias gbsu='git branch --set-upstream-to='

alias gadd='git add'
alias gst='git status'

#user
alias lgroup='cat /etc/group'
alias fgroup='cat /etc/group | grep '

#prog
alias pyinstall='sudo pip install'
alias py='python'
alias jv='java -jar'

getheaderloc () {
    str=$1
    if [ $str != "" ]; then
        echo "#include <$str>" | gcc -E -x c - | grep $str
    fi
}

