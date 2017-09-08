#!/bin/bash
# First: Copy raw version of this file into editor on new machine, chmod, and run it

# install packages
sudo apt-get -y update
sudo apt-get -y install git
sudo apt-get -y install valgrind

# from now on we assume we're in home directory
cd ~
# git settings and repo downloads
echo 'git config --global user.name "Larry Madeo"' >> .bashrc
echo 'git config --global user.email "lmadeo76@gmail.com"' >> .bashrc
echo $'git config --global credential.helper \'cache --timeout=86400\'' >> .bashrc
echo $'git config --global core.editor \"vim\"' >> .bashrc
git clone https://github.com/Hillmonkey/holbertonschool-sysadmin_devops
git clone https://github.com/Hillmonkey/holbertonschool-low_level_programming
git clone https://github.com/Hillmonkey/holbertonschool-higher_level_programming
git clone https://github.com/Hillmonkey/printf
git clone https://github.com/Hillmonkey/craigslist-checker
git clone https://github.com/holbertonschool/Betty.git

# Justin's bashrc additions
echo 'function parse_git_dirty {' >> .bashrc
echo '  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"' >> .bashrc
echo '}' >> .bashrc
echo 'function parse_git_branch {' >> .bashrc
echo '  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"' >> .bashrc
echo '}' >> .bashrc
echo 'export PS1="\[\033[1;30m\]\u \[\033[0;37m\] \[\033[1;32m\]\w\[\033[0m\]\n\[\033[1;31m\]\$(parse_git_branch) \[\033[0m\]\$ "' >> .bashrc

# echo 'betty() {' >> .bashrc
# echo '        ~/Betty/betty-style.pl $1' >> .bashrc
# echo '        ~/Betty/betty-doc.pl $1' >> .bashrc
# echo '}' >> .bashrc
# echo 'tabstospaces() {' >> .bashrc
# echo 'find . -name "*.$1" ! -type d -exec bash -c 'ex -c ":%s/\t/    /g" -c ":wq" "$0"' {} \;' >> .bashrc
# echo '}' >> .bashrc

echo '# Larry uses vim!' >> .bashrc
echo 'VISUAL=vim' >> .bashrc
echo 'EDITOR="$VISUAL"' >> .bashrc

# sensible vimscript additions'
# not using desertEx yet ...
echo 'mkdir -p ~/.vim/colors' >> .bashrc
# echo 'curl -o ~/.vim/colors/desertEx.vim https://raw.githubusercontent.com/flazz/vim-colorschemes/master/colors/desertEx.vim' >> .bashrc
# echo ' colorscheme desertEx' >> .vimrc
echo 'set tabstop=4 shiftwidth=4' >> .vimrc

echo '# Larrys bashrc' >> .bashrc
echo '# Larrys extra editions ################################' >> .bashrc
echo '# Larrys custom aliases #' >> .bashrc
echo "alias gzz='gcc -Wall -Wextra -pedantic -g'" >> .bashrc

# Betty installation (repo already cloned above) script
cd ~/Betty
sudo ./install.sh

# Go home
cd ~
