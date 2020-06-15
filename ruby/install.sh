#!/bin/sh

# Install rbenv
if test ! $(which rbenv)
then
  brew install rbenv
  rbenv init
fi