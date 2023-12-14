#!bin/bash
echo -n "Type new password: "
read -s new_pass
echo "git:${new_pass}" | chpasswd
echo "Succesfully, changed password from git."