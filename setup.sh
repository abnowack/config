# parse command line options
INSTALL=0
while getopts ":i" opt; do
  case $opt in
    i ) INSTALL=1 ;;
    \? ) echo 'usage ./setup_vim.sh [-i install setup]'
         exit 1
  esac
done
shift $(($OPTIND - 1))

if [[ $INSTALL -eq 1 ]]; then
  sudo apt-get update
  sudo apt-get install
  sudo apt-get install xfce4-terminal
  sudo apt-get install vim
  sudo apt-get install git
fi

cd bash
./setup_bash.sh
cd ../fonts
./setup_fonts.sh
cd ../vim
./setup_vim.sh
cd ../xfce4
./setup_xfce4.sh
cd ../git
./setup_git.sh
