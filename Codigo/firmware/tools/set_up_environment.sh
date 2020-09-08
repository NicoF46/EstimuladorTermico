sudo -S apt -y install $(cat packages.ubuntu.18.04.txt)
virtualenv -p python3 venv
source venv/bin/activate
pip install -r requirements.txt
echo "New virtualenvironment configured. Can be activated with the command:"
echo ""
echo "		source venv/bin/activate"
echo ""
