#!/bin/sh

# Install psql
if test ! $(which libpq)
then
  brew install libpq
fi