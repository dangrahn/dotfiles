#!/bin/sh

# Install Java
if test ! $(which java)
then
	brew install --cask homebrew/cask-versions/java11
	brew install --cask java
fi