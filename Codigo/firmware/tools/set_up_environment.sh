echo "Please enter the sudo password.\n\bPassword:" 
stty -echo
read SUDO_PASSWORD
stty echo
echo ${SUDO_PASSWORD} | sudo -S apt -y install $(cat $(dirname $0)/$package_file)