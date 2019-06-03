# Install node and npm
if test ! $(which nvm)
then
  echo "  Installing Node Version Manager for you."
  brew install nvm
  mkdir -p ~/.nvm
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
fi

if test ! $(which node)
then
  echo "  Installing Node for you."
  nvm install 6
fi

echo " Updating npm for you."
npm install npm@latest -g