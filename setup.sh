echo "Installing Docker using commands from this site: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker

echo "Installing python, pip, python3, and pip3..."
sudo apt-get update
sudo apt-get install -y python
sudo python --version
sudo apt-get install -y python-pip
sudo pip --version
sudo apt-get update
sudo apt-get install -y python3
sudo python3 --version
sudo apt-get install -y python3-pip
sudo pip3 --version

echo "copying app.py and README to home directory..."
cp /vagrant/data/app.py ./app.py

echo "upgrading pip..."
pip install --upgrade pip

echo "installing ddtrace..."
pip install ddtrace

echo "installing flask..."
pip install flask
