#!/bin/bash

username='stories2'
useradd -m $username
(echo "<PASSWORD>"; sleep 1; echo "<PASSWORD>";) | passwd $username
(echo "<PASSWORD>"; sleep 1; echo "<PASSWORD>" ) | smbpasswd -s -a $username

service smbd restart

#tail -f /dev/null
