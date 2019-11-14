#!/bin/sh

# Install Redis
if test ! $(which redis-server)
then
  brew install redis
fi