set -e
set -x

# Assuming we're alread at venv
#source .env/bin/activate
pip install jedi

if [[ ! -e ~/.vim/bundle ]]; then mkdir -p ~/.vim/bundle; fi
if [[ ! -e ~/.vim/autoload ]]; then mkdir -p ~/.vim/autoload; fi
if [[ ! -e ~/.vim/colors ]]; then mkdir -p ~/.vim/colors; fi

curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git

mkdir -p ~/.vim/ftplugin
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
# Folding script
#http://www.vim.org/scripts/script.php?script_id=1494

cd ~/.vim/bundle
git clone git://github.com/davidhalter/jedi-vim.git
cd jedi-vim
git submodule update --init

cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git

cd ~/.vim/colors
wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400

cd ~/.vim/bundle
git clone https://github.com/vim-scripts/pep8
pip install pep8

# http://blog.mattes-groeger.de/vim-bookmarks/
git clone https://github.com/MattesGroeger/vim-bookmarks.git ~/.vim/bundle/vim-bookmarks

# rope
cd ~/.vim/bundle
git clone https://github.com/python-rope/ropevim.git
