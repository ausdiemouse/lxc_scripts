#!/bin/bash

echo "Updating $(hostname) ..."
apt update
echo "Upgrading $(hostname) ..."
apt -y upgrade
echo "Clean up ..."
apt autoremove
apt autoclean
