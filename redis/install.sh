#!/bin/sh

# Install Redis
if test ! $(which redis)
then
  brew install redis
fi