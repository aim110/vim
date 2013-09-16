set -x

pip install jedi

if [[ ! -e ~/.vim/bundle ]]; then mkdir -p ~/.vim/bundle; fi
if [[ ! -e ~/.vim/autoload ]]; then mkdir -p ~/.vim/autoload; fi
if [[ ! -e ~/.vim/colors ]]; then mkdir -p ~/.vim/colors; fi

curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
http://www.vim.org/scripts/script.php?script_id=1494

cd ~/.vim/bundle
git clone git://github.com/davidhalter/jedi-vim.git
cd jedi-vim
git submodule update --init

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

cd ~/.vim/colors
wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
