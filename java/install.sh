#!/bin/sh

# Install Java
if test ! $(which java)
then
	brew cask install homebrew/cask-versions/java11
	brew cask install java
fi