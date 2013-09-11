set -x

cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
http://www.vim.org/scripts/script.php?script_id=1494

pip install jedi
cd ~/.vim/bundle
git clone git://github.com/davidhalter/jedi-vim.git
cd jedi-vim
git submodule update --init

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
