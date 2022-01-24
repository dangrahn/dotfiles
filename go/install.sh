#!/bin/sh

# Install Go
if test ! $(which go)
then
  brew install go
fi