#!/bin/sh

# Install AWS EB CLI
if test ! $(which eb)
then
  brew install awsebcli
fi