# Install node and npm
echo "  Installing Node Version Manager for you."
brew install nvm || brew upgrade nvm
mkdir -p ~/.nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

echo "  Installing Node for you."
nvm install 16

echo " Updating npm for you."
npm install -g npm