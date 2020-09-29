#!/bin/sh

# Install Google Cloud SDK
if test ! $(which gcloud)
then
  curl https://sdk.cloud.google.com > install_gce.sh
  chmod +x install_gce.sh
  ./install_gce.sh --disable-prompts
  rm ./install_gce.sh
fi