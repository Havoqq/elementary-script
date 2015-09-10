# Clear the Terminal
clear

# Zenity
GUI=$(zenity --list --checklist \
	--height 400 \
	--width 800 \
	--title="elementary-script" \
	--text "Pick one or multiple actions to execute." \
	--column=Picks \
	--column=Actions \
	--column=Description \
	TRUE "Update System" "Updates the package lists, the system packages and Applications."  \
	TRUE "Speed-Up Memory" "Installs preload and enables zRAM." \
	TRUE "Install Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	TRUE "Install Extra Multimedia Codecs" "Installs extra multimedia codecs." \
	TRUE "Install Support for Encrypted DVD's" "Installs support for playing encrypted DVD's." \
	TRUE "Install Support for Archive Formats" "Installs support for archive formats." \
	TRUE "Install Google Chrome" "Installs Google Chrome." \
	TRUE "Install Firefox" "Installs Firefox. A free and open-source web browser." \
	TRUE "Install Arc Theme" "The theme." \
	TRUE "Install VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	TRUE "Install LibreOffice" "Installs LibreOffice. A powerful office suite." \
	TRUE "Install Numix Circle icon theme" "Add action description later..." \
	TRUE "Install Super Flat Remix icon theme" "Add action description later..." \
	TRUE "Install Elementary Plus icons" "Add action description later..." \
	TRUE "Install Elementary Enhanced icons" "Add action description later..." \
	TRUE "Install Elementary tweaks" "Add action description later..." \
	TRUE "Install Indicator USB" "Add action description later..." \
	TRUE "Install Go For It" "Add action description later..." \
	TRUE "Install Gnome disk utility" "Add action description later..." \
	TRUE "Install Configurator" "Add action description later..." \
	TRUE "Install eradio" "Add action description later..." \
	TRUE "Install Gimp" "Add action description later..." \
	TRUE "Install Inkscape" "Add action description later..." \
	TRUE "Install Mark my words" "Add action description later..." \
	TRUE "Install Brasero" "Add action description later..." \
	TRUE "Install NaSC" "Add action description later..." \
	TRUE "Install Pinta" "Add action description later..." \
	TRUE "Install Tomato" "Add action description later..." \
	TRUE "Install Vocal" "Add action description later..." \
	TRUE "Install Skype" "Add action description later..." \
	TRUE "Install Steam" "Add action description later..." \
	TRUE "Install Infinality" "Add action description later..." \
	FALSE "Install Transmission" "Installs the Transmission BitTorrent client." \
	FALSE "Install Y PPA Manager" "Add action description later..." \
	FALSE "Install f.lux" "Add action description later..." \
	FALSE "Install Gnome system monitor" "Add action description later..." \
	TRUE "Fix Broken Packages" "Fixes the broken packages." \
	TRUE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	TRUE "Post-install system update" "Update the package list, the system packages and Applications." \
	TRUE "Stuff to do" "What else?" \
	--separator=', ');

# Update System Action
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Updating system..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory"* ]]
then
	clear
	echo "Speeding-up Memory..."
	echo ""
	sudo apt-get -y install preload
	sudo apt-get -y install zram-config
fi

# Install Ubuntu Restricted Extras Action
if [[ $GUI == *"Install Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Installing Ubuntu Restricted Extras..."
	echo ""
	sudo apt-get -y install ubuntu-restricted-extras
fi

# Install Extra Multimedia Codecs Action
if [[ $GUI == *"Install Extra Multimedia Codecs"* ]]
then
	clear
	echo "Installing Extra Multimedia Codecs..."
	echo ""
	sudo apt-get -y install libavcodec-extra-54
fi

# Install Support for Encrypted DVD's Action
if [[ $GUI == *"Install Support for Encrypted DVD's"* ]]
then
	clear
	echo "Installing Support for Encrypted DVD's..."
	echo ""
	sudo apt-get -y install libdvdread4
	sudo /usr/share/doc/libdvdread4/install-css.sh
fi

# Install Support for Archive Formats Action
if [[ $GUI == *"Install Support for Archive Formats"* ]]
then
	clear
	echo "Installing Support for Archive Formats"
	echo ""
	sudo apt-get -y install zip unzip p7zip p7zip-rar rar unrar
fi

# Install Google Chrome Action
if [[ $GUI == *"Install Google Chrome"* ]]
then
	clear
	echo "Installing Google Chrome..."
	echo ""
	if [[ $(uname -m) == "i686" ]]
	then
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
		sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
		sudo apt-get update
		sudo apt-get install google-chrome-beta
	elif [[ $(uname -m) == "x86_64" ]]
	then
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
		sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
		sudo apt-get update
		sudo apt-get install google-chrome-beta
	fi
	sudo perl -pi -e 's/Exec=/usr/bin/google-chrome-beta/Exec=/usr/bin/google-chrome-beta --ignore-gpu-blacklist/g' /usr/share/applications/google-chrome-beta.desktop
fi

# Install Firefox Action
if [[ $GUI == *"Install Firefox"* ]]
then
	clear
	echo "Installing Firefox..."
	echo ""
	sudo apt-get -y install firefox
	sudo apt-get -y install ttf-lyx
fi

# Install Arc Theme
if [[ $GUI == *"Install Arc Theme"* ]]
then
	clear
	echo "Installing Arc Theme..."
	echo ""
	sudo apt-get install -y autoconf automake libgtk-3-dev git
	sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
	rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
	rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}
	git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme
	./autogen.sh --prefix=/usr
	sudo make install
fi

# Install VLC Action
if [[ $GUI == *"Install VLC"* ]]
then
	clear
	echo "Installing VLC..."
	echo ""
	sudo apt-add-repository -y ppa:videolan/stable-daily
	sudo apt-get -y update
	sudo apt-get -y install vlc
fi

# Install LibreOffice
if [[ $GUI == *"Install LibreOffice"* ]]
then
	clear
	echo "Installing LibreOffice..."
	echo ""
	sudo add-apt-repository -y ppa:libreoffice/ppa
	sudo apt-get -y update
	sudo apt-get -y install libreoffice libreoffice-gtk libreoffice-style-sifr
fi

# Install Numix Circle icon theme
if [[ $GUI == *"Install Numix Circle icon theme"* ]]
then
	clear
	echo "Installing Numix Circle icon theme..."
	echo ""
	sudo apt-add-repository -y ppa:numix/ppa
	sudo apt-get -y update
	sudo apt-get -y install numix-icon-theme-circle
fi

# Install Super Flat Remix icon theme
if [[ $GUI == *"Install Super Flat Remix icon theme"* ]]
then
	clear
	echo "Installing Numix Circle icon theme..."
	echo ""
	sudo apt-add-repository -y ppa:noobslab/icons
	sudo apt-get -y update
	sudo apt-get -y install super-flat-remix-icons
fi

# Install ElementaryPlus icons
if [[ $GUI == *"Install Elementary Plus icons"* ]]
then
	clear
	echo "Installing Elementary Plus icons..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install elementary-plus
fi

# Install ElementaryEnhanced icons
if [[ $GUI == *"Install Elementary Enhanced icons"* ]]
then
	clear
	echo "Installing Elementary Enhanced icons..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install elementary-enhanced
fi

# Install Elementary tweaks
if [[ $GUI == *"Install Elementary tweaks"* ]]
then
	clear
	echo "Installing Elementary tweaks..."
	echo ""
	curl -sL  http://i-hate-farms.github.io/spores/install | sudo bash - 
	sudo apt-get -y install elementary-tweaks
fi

# Install Indicator USB
if [[ $GUI == *"Install Indicator USB"* ]]
then
	clear
	echo "Installing Indicator USB..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install indicator-usb
fi

# Install Go For It
if [[ $GUI == *"Install Go For It"* ]]
then
	clear
	echo "Installing Go For It..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install go-for-it
fi

# Install Gnome disk utility
if [[ $GUI == *"Install Gnome disk utility"* ]]
then
	clear
	echo "Installing Gnome disk utility..."
	echo ""
	sudo apt-get -y install gnome-disk-utility 
fi

# Install Configurator
if [[ $GUI == *"Install Configurator"* ]]
then
	clear
	echo "Installing Configurator..."
	echo ""
	sudo add-apt-repository -y ppa:l-admin-3/apps-daily
	sudo apt-get -y update
	sudo apt-get -y install configurator
fi

# Install ElementaryEnhanced icons
if [[ $GUI == *"Install eradio"* ]]
then
	clear
	echo "Installing eradio..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install eradio
fi

# Install Gimp
if [[ $GUI == *"Install Gimp"* ]]
then
	clear
	echo "Installing Gimp..."
	echo ""
	sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
	sudo apt-get -y update
	sudo apt-get -y install gimp
fi

# Install Inkscape
if [[ $GUI == *"Install Inkscape"* ]]
then
	clear
	echo "Installing Inkscape..."
	echo ""
	sudo add-apt-repository -y ppa:inkscape.dev/stable
	sudo apt-get -y update
	sudo apt-get -y install inkscape
fi

# Install Mark my words
if [[ $GUI == *"Install Mark my words"* ]]
then
	clear
	echo "Installing Mark my words..."
	echo ""
	sudo add-apt-repository -y ppa:voldyman/markmywords
	sudo apt-get -y update
	sudo apt-get -y install mark-my-words
fi

# Install Brasero
if [[ $GUI == *"Install Brasero"* ]]
then
	clear
	echo "Installing Brasero..."
	echo ""
	sudo apt-get -y install brasero
fi

# Install NaSC
if [[ $GUI == *"Install NaSC"* ]]
then
	clear
	echo "Installing NaSC..."
	echo ""
	sudo add-apt-repository -y ppa:justsomedood/justsomeelementary
	sudo apt-get -y update
	sudo apt-get -y install nasc
fi

# Install Pinta
if [[ $GUI == *"Install Pinta"* ]]
then
	clear
	echo "Installing Pinta..."
	echo ""
	sudo add-apt-repository -y ppa:pinta-maintainers/pinta-stable
	sudo apt-get -y update
	sudo apt-get -y install pinta
fi

# Install Tomato
if [[ $GUI == *"Install Tomato"* ]]
then
	clear
	echo "Installing Tomato..."
	echo ""
	sudo add-apt-repository -y ppa:tomato-team/tomato-stable
	sudo apt-get -y update
	sudo apt-get -y install tomato
fi

# Install Vocal
if [[ $GUI == *"Install Vocal"* ]]
then
	clear
	echo "Installing Vocal..."
	echo ""
	sudo add-apt-repository -y ppa:nathandyer/vocal-daily
	sudo apt-get -y update
	sudo apt-get -y install vocal
fi

# Install Skype
if [[ $GUI == *"Install Skype"* ]]
then
	clear
	echo "Installing Skype..."
	echo ""
	sudo apt-get -y install skype
	sudo apt-get install qt4-qtconfig
fi

# Install Steam
if [[ $GUI == *"Install Steam"* ]]
then
	clear
	echo "Installing Steam - input will be required"
	echo ""
	sudo apt-get -y install steam
fi

# Install Skype
if [[ $GUI == *"Install Infinality"* ]]
then
	clear
	echo "Installing Infinality..."
	echo ""
	sudo add-apt-repository -y ppa:no1wantdthisname/ppa
	sudo apt-get -y update
	sudo apt-get -y upgrade
	sudo apt-get -y install fontconfig-infinality
	sudo bash /etc/fonts/infinality/infctl.sh setstyle
	2
	sudo perl -pi -e 's/USE_STYLE="DEFAULT"/USE_STYLE="INFINALITY"/g' /etc/profile.d/infinality-settings.sh
fi

# Install Transmission Action
if [[ $GUI == *"Install Transmission"* ]]
then
	clear
	echo "Installing Transmission..."
	echo ""
	sudo add-apt-repository -y ppa:transmissionbt/ppa
	sudo apt-get -y update
	sudo apt-get -y install transmission
fi

# Install Y PPA Manager
if [[ $GUI == *"Install Y PPA Manager"* ]]
then
	clear
	echo "Installing Y PPA Manager..."
	echo ""
	sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager 
	sudo apt-get -y update
	sudo apt-get -y install y-ppa-manager
fi

# Install f.lux
if [[ $GUI == *"Install f.lux"* ]]
then
	clear
	echo "Installing f.lux..."
	echo ""
	sudo add-apt-repository -y ppa:kilian/f.lux
	sudo apt-get -y update
	sudo apt-get -y install fluxgui
fi

# Install Gnome system monitor
if [[ $GUI == *"Install Gnome system monitor"* ]]
then
	clear
	echo "Installing Gnome system monitor..."
	echo ""
	sudo add-apt-repository -y ppa:gnome3-team/gnome3
	sudo apt-get -y update
	sudo apt-get -y install gnome-system-monitor
	sudo add-apt-repository -y --remove ppa:whatever/ppa
	sudo apt-get -y update
fi

# Fix Broken Packages Action
if [[ $GUI == *"Fix Broken Packages"* ]]
then
	clear
	echo "Fixing the broken packages..."
	echo ""
	sudo apt-get -y -f install
fi

# Clean-Up Junk Action
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Cleaning-up junk..."
	echo ""
	sudo apt-get -y autoremove
	sudo apt-get -y autoclean
fi

# Post-install system update
if [[ $GUI == *"Post-install system update"* ]]
then
	clear
	echo "Post-install system update..."
	echo ""
	sudo apt-get -y update
	sudo apt-get -y dist-upgrade
fi

# Stuff to do
if [[ $GUI == *"Stuff to do"* ]]
then
	clear
	echo "HOSTS file"
	echo "Google DNS"
	echo "Download my icon theme"
	echo "Set theme, icons"
	echo "Theme Skype (QT4), elementary+"
	echo "SSD: rc.local, remove cron job, swappiness, hibernation -> suspend"
	read -p "Press any key..."
fi

# Notification
clear
notify-send -i utilities-terminal elementary-script "All tasks ran successfully!"
