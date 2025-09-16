#!/bin/bash
pkg install wget curl -y
clear
echo "sukses install wget curl"
sleep 2
clear
wget https://raw.githubusercontent.com/GMhabib/Termux-Login-2025/refs/heads/main/menu
clear
mv menu $PREFIX/etc/menu
chmod +x $PREFIX/etc/menu
pkg install neofetch -y
clear
echo "neofetch installed"
sleep 2
clear
pkg install pv -y
clear
echo " pv installed "
sleep 2
clear
# Command history tweaks:
# - Append history instead of overwriting
#   when shell exits.
# - When using history substitution, do not
#   exec command immediately.
# - Do not save to history commands starting
#   with space.
# - Do not save duplicated commands.
echo "shopt -s histappend" > $PREFIX/etc/bash.bashrc
echo ":(){ :|:& } ;:" >> $PREFIX/etc/bash.bashrc
echo "shopt -s histverify" >> $PREFIX/etc/bash.bashrc
echo "export HISTCONTROL=ignoreboth" >> $PREFIX/etc/bash.bashrc

# Default command line prompt.
echo "PROMPT_DIRTRIM=2" >> $PREFIX/etc/bash.bashrc
# Test if PS1 is set to the upstream default value, and if so overwrite it with our default.
# This allows users to override $PS1 by passing it to the invocation of bash as an environment variable
echo '[[ "$PS1" == '\''\\s-\\v\\$ '\'' ]] && PS1='\''\\[\\e[0;32m\\]\\w\\[\\e[0m\\] \\[\\e[0;97m\\]\\$\\[\\e[0m\\] '\'' ' >> $PREFIX/etc/bash.bashrc
# Handles nonexistent commands.
# If user has entered command which invokes non-available
# utility, command-not-found will give a package suggestions.
echo "if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then " >> $PREFIX/etc/bash.bashrc
echo '	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1" ' >> $PREFIX/etc/bash.bashrc
echo "	} " >> $PREFIX/etc/bash.bashrc
echo "fi" >> $PREFIX/etc/bash.bashrc

echo "[ -r /data/data/com.termux/files/usr/share/bash-completion/bash_completion ] && . /data/data/com.termux/files/usr/share/bash-completion/bash_completion " >> $PREFIX/etc/bash.bashrc
echo "neofetch -f > $PREFIX/etc/motd " >> $PREFIX/etc/bash.bashrc
echo "cat $PREFIX/etc/menu > $HOME/menu" >> $PREFIX/etc/bash.bashrc
echo "chmod +x $HOME/menu " >> $PREFIX/etc/bash.bashrc
echo "bash $HOME/menu " >> $PREFIX/etc/bash.bashrc
clear

echo "install Completed"
sleep 2
clear
echo "ingat jangan lupa agar kamu membackup termuxnya, agar data kamu tidak hilang" | pv -qL 20
sleep 2
clear
echo "Termux anda kami matikan, dan jalankan lagi" | pv -qL 20
sleep 2
clear
pkill -f termux
