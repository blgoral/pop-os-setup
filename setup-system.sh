#! /bin/bash

sudo apt update

sudo apt install -y neofetch dotnet6 nodejs npm python3 software-properties-common gnome-tweaks

# install mono
# sudo apt install -y gnupg ca-certificates
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
# echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
# sudo apt update
# sudo apt install -y mono-devel

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo rm ./google-chrome-stable_current_amd64.deb

#install postman
sudo flatpak install flathub com.getpostman.Postman -y

# create certs for dotnet
sudo apt install -y libnss3-tools
git clone https://github.com/BorisWilhelms/create-dotnet-devcert.git
chmod +x ./create-dotnet-devcert/scripts/ubuntu-create-dotnet-devcert.sh
sudo ./create-dotnet-devcert/scripts/ubuntu-create-dotnet-devcert.sh
sudo rm -rf ./create-dotnet-devcert/

# install discord
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo apt install -y ./discord.deb
sudo rm ./discord.deb

# install spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

# install veracrypt
sudo add-apt-repository ppa:unit193/encryption
sudo apt update
sudo apt install -y veracrypt

# install visual studio code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
