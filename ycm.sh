# taken from here: https://gist.github.com/ChengLong/6208775
set -e 

brew install cmake
cd ~/.vim/bundle
git clone https://github.com/Valloric/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
./install.sh
cmake -G "Unix Makefiles" . ./third_party/ycmd/cpp
make ycm_core
