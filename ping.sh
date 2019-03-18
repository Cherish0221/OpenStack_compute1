#!/bin/bash
transmitted=`grep 'packets transmitted' /var/ping.log | tail -n 1 | awk '{print $1}'`
received=`grep 'packets transmitted' /var/ping.log | tail -n 1 | awk '{print $4}'`
lost=`expr $transmitted - $received`
# echo "downtime is $lost ms"
downtime=$(echo "scale=3; $lost / 1000" | bc)
echo "downtime is $downtime s"
