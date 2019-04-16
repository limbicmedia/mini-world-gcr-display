#!/usr/bin/env bash

## Mini-World GCR Installer
# This script installs the PiMediaSync application and sets 
# up all of the components (video and config) necessary to 
# run the installation. 
#
# Note, all ENV with 'export' are used by the PiMediaSync setup script

set -e
if [ "$(whoami)" != "root" ]; then
    echo "must be run as root."
    exit 1
fi

HOMEDIR="${HOMEDIR:-/root}"
WORKDIR="${HOMEDIR}/gcr"
GCR_VERSION="${GCR_VERSION:-1.0.0}"

# mini-world-gcr repo uses git lfs, currently not available on RPI
# so, wget the files we want
rm -rf ${WORKDIR} # clear first
wget -P ${WORKDIR} https://raw.githubusercontent.com/limbicmedia/mini-world-gcr-display/${GCR_VERSION}/gcr_config.py
wget -P ${WORKDIR} https://github.com/limbicmedia/mini-world-gcr-display/raw/${GCR_VERSION}/PIMEDIASYNC_VERSION

export PIHOSTNAME="miniworld-gcr"

# Setup PiMediaSync application
GCR_CONFIG_FILE="${GCR_CONFIG_FILE:-gcr_config.py}"
export APPLICATION_FLAGS="-c${WORKDIR}/${GCR_CONFIG_FILE}"
export PIMEDIASYNC_VERSION="${PIMEDIASYNC_VERSION:-$(cat ${WORKDIR}/PIMEDIASYNC_VERSION)}"
wget -O - https://raw.githubusercontent.com/limbicmedia/PiMediaSync/${PIMEDIASYNC_VERSION}/scripts/install.sh | bash

# install video in location used by PiMediaSync
PIMEDIASYNC_DIR="${PIMEDIASYNC_DIR:-/opt/pimediasync}" # come from export in pimediasync setup
ln -s ${WORKDIR}/video ${PIMEDIASYNC_DIR}/video

echo "Installation Finished, reboot the device."
set +e
