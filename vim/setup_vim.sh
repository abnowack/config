# script to install hg managed vimrc
# TODO test if git and clang installed (for clang-format)

THISPATH="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# parse command line options
OFFLINE=0
while getopts ":o" opt; do
  case $opt in
    o ) OFFLINE=1 ;;
    \? ) echo 'usage ./setup_vim.sh [-o offline]'
         exit 1
  esac
done
shift $(($OPTIND - 1))

if [[ ! -d ~/.vim ]]; then
  mkdir ~/.vim
fi

if [[ -d ~/.vim/bundle/vundle ]]; then
  echo "Vundle already installed, proceeding ..."
elif [[ $OFFLINE -eq 0 ]]; then
  echo -n "Installing Vundle ... "
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
  echo "done"
fi

cp $THISPATH/vimrc ~/.vimrc
if [[ ! -d ~/.vim/colors ]]; then
  mkdir ~/.vim/colors
fi
cp $THISPATH/zenburn.vim ~/.vim/colors

if [[ ! -d ~/.vim-tmp ]]; then
  mkdir ~/.vim-tmp
fi

echo "Updated vimrc."

cp $THISPATH/gvimrc ~/.gvimrc
# if Droid Sans Mono not installed, comment it out in ~/.gvimrc
if [[ -z $(fc-list | grep "DroidSansMono") ]]; then
  sed -i -e 's/set guifont/\" set guifont/' ~/.gvimrc
  sed -i -e 's/\" set fallback_guifont/set guifont/' ~/.gvimrc
fi 

if [[ $OFFLINE -eq 0 ]]; then
  echo "To install vim packages, open vim and enter :BundleInstall"
fi
