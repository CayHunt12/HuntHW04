#!/bin/bash
# A small Bash script to set up User LED3 to be turned on or off from 
#  Linux console. Written by Derek Molloy (derekmolloy.ie) for the 
#  book Exploring BeagleBone.

LED3_PATH=/sys/class/leds/beaglebone:green:usr3

# Example bash function
function removeTrigger
{
  echo "none" >> "$LED3_PATH/trigger"
}

echo "Starting the LED Bash Script"
if [ $# -eq 0 ]; then
  echo "There are no arguments. Usage is:"
  echo -e " bashLED Command \n  where command is one of "
  echo -e "   on, off, flash or status  \n e.g. bashLED on "
  exit 2
fi

removeTrigger

# Assign arguments to variables
blink=$1
n=$2

          # Blink the LED n times
          for ((i=0; i<n; i++)) 
          do
              echo "1" >> "$LED3_PATH/brightness"  # Turn the LED on
              sleep 1                             # Wait for 1 second
              echo "0" >> "$LED3_PATH/brightness"  # Turn the LED off
              sleep 1  #Wait for 1 second
          done 
echo "End of the LED Bash Script"
