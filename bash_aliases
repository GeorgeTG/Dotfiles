#navigation
alias ..='cd ..'
alias d='ls -hl --sort=extension --time-style=long-iso --group-directories-first'
alias da='ls -la'
alias tree='tree -aC'

#system
alias lprocess='pgrep -l .'
alias fprocess='pgrep -l'

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

#netowrk

#tar
alias mktgz='tar -zcvf'
alias untgz='tar -zxvf'

#git 
alias gi='git init'

alias gc='git commit -m'
alias gca='git commit -a -m'

alias gps='git push'
alias gpl='git pull'

alias gradd='git remote add origin'
alias gbsu='git branch --set-upstream-to='

alias gadd='git add'
alias gst='git status'

grinit () {
    if [ -z "$1" ]; then
        echo "Please give an argument!" 
    else
        gi

        if [ -z "$2"]; then
            touch README.md
            gadd README.md
        else
            gadd $2
        fi

        gc "First commit!"
        gradd origin $1
        gps -u origin master

    fi
}

#user
alias lgroup='cat /etc/group'
alias fgroup='cat /etc/group | grep '

#prog
alias pyinstall='sudo pip install'
alias py='python'
alias jv='java -jar'
    #compile with warnings and debug symbols
gccc () {
    str=$1
    if [ $str != "" ]; then
        gcc -Wall -g $str -o  ${str%.c}
    fi
}
