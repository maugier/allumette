#!/bin/sh

echo "This is OpenAllumette installator\n\n"


DISTRIBUTION=$(lsb_release -i | sed 's/Distributor ID:\t//')
LOCALPATH=~/.allumette
SRC_URI="https://github.com/FauveNoir/allumette.git"

case $DISTRIBUTION in
	"Debian")
		echo "* Installing all needed packages"
		sudo aptitude install git python3 python3-pip || { echo "Cannot pull needed packages"; exit 1; }

		echo "* Installing Pygame with Pip"
		pip3 install Pygame || { echo "Cannot install pygame"; exit 2; }

		echo "Downloading and inpacking OpenAllumette"

	;;
	"ManjaroLinux")
		echo "* Installing all needed packages"
		sudo yaourt -S git python

		echo "* Installing pip for python3"
		mkdir /tmp/allumette
		cd /tmp/allumette
		curl -O https://bootstrap.pypa.io/get-pip.py
		python get-pip.py

		echo "* Installing Pygame with Pip"
		pip3 install Pygame

		echo "Downloading and inpacking OpenAllumette"

	;;
	*)
		echo "There is not yet installation for your distribution.\nMaybe are you a volunteer to do it? :)"
        echo "Trying to install using pip3 anyway"
	;;
esac

{ cd ${LOCALPATH}; git pull; } || \
        git clone ${SRC_URI} ${LOCALPATH} || \
        { echo "Cannot download source"; exit 3; }

pip3 install --user ~/.allumette && \
		echo "\n\nYou can now run OpenAllumette with the command allumette. Good game." || \
        { echo "Failed to run pip3."; exit 4; }
