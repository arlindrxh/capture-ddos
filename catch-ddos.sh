#!/bin/bash

#created with love by ARLIND REXHA
# Put a name where u want the IP's to be saved.
OUTPUT_FILE="spamming_ips.txt"

# Use "nohup" to leave "tcpdump" running in the background even if you close putty or ssh by mistake the script will be working still
while true; do
  nohup tcpdump -n -Q in -l | awk '{print $3}' > $OUTPUT_FILE &

  # Counting each occurrence from each IP.
  cat $OUTPUT_FILE | sort | uniq -c > $OUTPUT\_FILE.tmp

  # Deleting IP's which have send less than 100 packets per second
  grep -v '^ *[0-9]* ' $OUTPUT\_FILE.tmp > $OUTPUT\_FILE
  mv $OUTPUT\_FILE.tmp $OUTPUT\_FILE

  # Display of the message showing that the script has finished.
  echo "IP addresses that have sent more than 100 packets have been saved to $OUTPUT\_FILE"

  # Wait 10seconds before re-starting the script again
  sleep 10
done

#--------------------------------------------

#-!!!!!!!!!!!!!!!                  WARNING                    !!!!!!!!!!!!!!!!!!!

#This article is for educational purposes only, the author is not responsible for their misuse by unauthorized persons.

#best regards,
#Arlind Rexha
