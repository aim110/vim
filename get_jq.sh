set -ex

mkdir -p $HOME/bin
curl -Lo $HOME/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x $HOME/bin/jq
echo 'PATH=$PATH:$HOME/bin' >> $HOME/.bashrc
