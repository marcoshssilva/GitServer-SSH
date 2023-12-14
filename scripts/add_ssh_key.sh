#!bin/bash
if [ "$1" != "ssh-rsa" ] || [ -z "$2" ]; then
  echo "Missing ssh-key or format invalid."
  echo "Please use sintax: sh add_ssh_key.sh ssh-rsa YOUR_RSA_KEY_HERE"
  exit 1
fi
cat << EOF >> /home/git/.ssh/authorized_keys
$1 $2 $3
EOF
echo "Succesfully, key was included in /home/git/.ssh/authorized_keys"