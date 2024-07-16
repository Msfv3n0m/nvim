# Install nvim
wget https://github.com/neovim/neovim/releases/download/v10.0/nvim.appimage 
chmod u+x nvim.appimage 
mv nvim.appimage ~/.local/bin/nvim
# install nerdfont
# curl -sS https://webi.sh/nerdfont | sh
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
unzip 0xProto.zip
mv 0xProtoNerdFont-Regular.ttf ~/.local/share/fonts/
rm -rf 0xProto*.ttf
# install ripgrep
sudo apt install ripgrep -y
# install fd
sudo apt install fd-find -y
# install git 
sudo apt install git -y
# install nvchad
git clone https://github.com/Msfv3n0m/nvim 
cp -r nvim/nvim ~/.config/nvim 
# Install python
# sudo apt install python -y
# Install python dependencies
pip install python-lsp-server pynvim
# Copy custom configs
# cp lspconfig.lua ~/.config/nvim/lua/configs
# cp plugins/init.lua ~/.config/nvim/lua/plugins
# cp init.lua ~/.config/nvim/lua/
# cp mappings.lua ~/.config/nvim/lua