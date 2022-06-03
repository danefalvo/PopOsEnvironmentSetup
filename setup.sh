#!/bin/bash
sudo apt-get update

#VS Code Stuff
sudo apt-get install software-properties-common apt-transport-https
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

#SOLAAR (For Logitech Mice)
#Dependencies
sudo apt install python3-pip

git clone https://github.com/pwr-Solaar/Solaar.git
pip install --user ./Solaar
sudo chmod +x setup.cfg
sudo touch /etc/xdg/autostart/Solaar.desktop
chmod +rw ./Solaar/rules.d
sudo mv ./Solaar/rules.d/42-logitech-unify-permissions.rules /etc/udev/rules.d
sudo udevadm control --reload-rules

#Remmina Stuff
sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
sudo apt-get update
sudo apt-get install remmina remmina-plugin-rdp remmina-plugin-secret

sudo killall remmina

#FlameShot (Screenshot Recorder)
sudo apt-get install flameshot

#Peek (Gif Recorder)
sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt install peek

#Tactile Tiling Manager
wget https://gitlab.com/lundal/tactile/-/archive/master/tactile-master.tar.gz

#Brave
Sudo apt install apt-transport-https curl gnupg
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt-get update
sudo apt install brave-browser


#OBS Studio
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt-get update
sudo apt-get install obs-studio

#Gnome Tweaks
sudo apt install gnome-tweaks

#MELD
sudo apt-get install meld
sudo apt-get install intltool itstool gir1.2-gtksource-3.0 libxml2-utils

#DOTNET
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb


sudo apt-get update
sudo apt-get install -y apt-transport-https 
sudo apt-get update
sudo apt-get install -y dotnet-sdk-6.0


wget https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh

# Powershell
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.2.3/powershell-7.2.3-linux-x64.tar.gz
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
#Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7
# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7/pwsh
# Create the symbolic link that points to pwsh
sudo ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh

#Open in Code Context Menu
bash -c "$(wget -qO- https://raw.githubusercontent.com/harry-cpp/code-nautilus/master/install.sh)"

# Octopus Tentacle
sudo apt-key adv --fetch-keys https://apt.octopus.com/public.key

sudo add-apt-repository "deb https://apt.octopus.com/ stretch main"
# for Raspbian use 
# sh -c "echo 'deb https://apt.octopus.com/ buster main' >> /etc/apt/sources.list"

sudo apt-get update
sudo apt-get install tentacle -f

