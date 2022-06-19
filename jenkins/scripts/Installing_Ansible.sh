#!/bin/sh
echo "Downloading Ansible"
echo "Getting Ansible"
curl https://bootstrap.pypa.io/get-pip.py -o $WORKSPACE/jenkins/scripts/get-pip.py
echo "Display Files and Directory"
ls $WORKSPACE/jenkins/scripts/
echo "Going to respected Directory"
cd $WORKSPACE/jenkins/scripts/
echo "Installing PIP for Installing Ansible"
python get-pip.py -v
echo "Installing Ansible"
python -m pip install ansible -v
echo "Verifying if Ansible is installed"
ansible -i hosts all -m ping
