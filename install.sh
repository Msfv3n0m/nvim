# Install nvim
# wget https://github.com/neovim/neovim/releases/download/v10.0/nvim.appimage 
# chmod u+x nvim.appimage 
# mv nvim.appimage ~/.local/bin/nvim
wget https://github.com/neovim/neovim/releases/download/v0.10.0/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
mkdir -p ~/.local/bin/
mv nvim-linux64 ~/.local/bin/
ln -s /home/$USER/.local/bin/nvim-linux64/bin/nvim /home/$USER/.local/bin/nvim
echo 'export PATH="/home/$USER/.local/bin:$PATH"' | tee -a "~/.*rc"
# install nerdfont
# curl -sS https://webi.sh/nerdfont | sh
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip
unzip 0xProto.zip
mkdir -p /home/mriggs/.local/share/fonts/
cp 0xProtoNerdFont-Regular.ttf ~/.local/share/fonts/
sudo cp 0xProtoNerdFont-Regular.ttf /usr/local/share/fonts/
fc-cache -f
rm -rf 0xProto*.ttf
rm -rf 0xProto*.ttf
# install ripgrep
sudo apt install ripgrep -y
# install fd
sudo apt install fd-find -y
# install git 
sudo apt install git -y
# install nvchad
# git clone https://github.com/Msfv3n0m/nvim 
# cp -r nvim/nvim ~/.config/nvim 
# Install python
# sudo apt install python -y
# Install python dependencies
pip install python-lsp-server pynvim
# Copy custom configs
# cp lspconfig.lua ~/.config/nvim/lua/configs
# cp plugins/init.lua ~/.config/nvim/lua/plugins
# cp init.lua ~/.config/nvim/lua/
# cp mappings.lua ~/.config/nvim/lua
rm -rf 0xProto.zip nvim-linux64.tar.gz LICENSE README.md
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
