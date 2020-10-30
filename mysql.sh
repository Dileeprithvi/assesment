#!/usr/bin/expect -f


spawn mysql_secure_installation

expect  "Enter current password for root \(enter for none\)\: "
send -- "\r"
sleep 1

expect  "Set root password\?\s\[Y\/n\]\s"
send -- "n\r"
sleep 1


expect  "Remove anonymous users\?\s\[Y\/n\]\s"
send -- "n\r"
sleep 1


expect  "Disallow root login remotely\?\s\[Y\/n\]\s"
send -- "Y\r"
sleep 1

expect  "Remove test database and access to it\? \[Y\/n\] "
send -- "n\r"
sleep 1

expect  "Reload privilege tables now\? \[Y\/n\] "
send -- "Y\r"
sleep 1

expect -re "All done\!"
sleep 1
send "\r"

exit

