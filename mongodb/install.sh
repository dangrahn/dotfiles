#!/bin/sh

# Install MongoDB
if test ! $(which mongo)
then
  brew tap mongodb/brew
  brew install mongodb-community@4.2
fi