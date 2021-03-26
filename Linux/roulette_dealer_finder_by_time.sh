#!bin/bash

grep -E "05:00:00 AM|08:00:00 AM|02:00:00 PM|08:00:00 PM|11:00:00 PM|Roulette_Dealer_FNAME LAST" 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule
awk '{print $1, $2, $5, $6}'
