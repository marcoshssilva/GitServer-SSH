#!bin/bash
echo -n "Type new password: "
read -s new_pass
echo "root:${new_pass}" | chpasswd
echo "Succesfully, changed password from root."