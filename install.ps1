# Install choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Install nvim
choco install neovim -y
# install nerdfont
iwr https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip -outfile 0xProto.zip
expand-archive 0xProto.zip
# install ripgrep
choco install ripgrep -y
# install fd
choco install fd -y
# install mingw
choco install mingw -y
# install gnuwin32
choco install gnuwin32-coreutils.install -y
# install git 
choco install git.install -y
# install nvchad
git clone https://github.com/Msfv3n0m/nvim 
cp -r nvim/nvim $ENV:USERPROFILE/AppData/Local/nvim 
# Install python
# choco install python -y
# Install python dependencies
pip install python-lsp-server pynvim
# Copy custom configs
# cp lspconfig.lua $ENV:USERPROFILE\AppData\Local\nvim\lua\configs
# cp plugins\init.lua $ENV:USERPROFILE\AppData\Local\nvim\lua\plugins
# cp mappings.lua $ENV:USERPROFILE\AppData\Local\nvim\lua
# cp init.lua $ENV:USERPROFILE\AppData\Local\nvim\lua

# Additional configuration
write-host "add this to path" -ForegroundColor yellow
python -c "import sys; print(sys.exec_prefix)"
sysdm.cpl
## configure nerdfont (Droid SANS Mono NF): https://medium.com/nerd-for-tech/neovim-but-its-in-windows-f39f181afaf9
write-host "install 0xProto font for all users and set as default https://medium.com/nerd-for-tech/neovim-but-its-in-windows-f39f181afaf9" -ForegroundColor yellow