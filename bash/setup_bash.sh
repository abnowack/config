# if ~/.bashrc has line beginning with #HGTAG, the following lines are deleted
# ./bashrc is then appended to ~/.bashrc

HGTAG_LINE=$(grep -n "#HGTAG" ~/.bashrc)
HGTAG_LINENUM=${HGTAG_LINE%:*}
THISPATH="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $HGTAG_LINENUM -gt 0 ]]; then
  sed -i "$HGTAG_LINENUM,\$d" ~/.bashrc 
fi

cat $THISPATH/bashrc >> ~/.bashrc
