#!/bin/bash
  
logfile="/var/log/auth.log"
users=("zeus" "hera" "demeter" "poseidon")

for user in "${users[@]}"; do
  echo "User $user has number of logins $(grep -c "$user" $logfile)"

  first_login=$(grep "$user" $logfile | head -n 1 | awk '{print $1, $2, $3}')
  last_login=$(grep "$user" $logfile | tail -n 1 | awk '{print $1, $2, $3}')
  echo "First login of $user at $first_login"
  echo "Last login of $user at $last_login"

  time_diff=$(($(date -d "$last_login" +%s) - $(date -d "$first_login" +%s)))
  time_diff_formatted=$(date -u -d @"$time_diff" +"%T")
  echo "The time difference between first and last login was $time_diff_formatted."

  num_logins=$(grep -c "$user" $logfile)
  average_time_diff=$((time_diff / (num_logins - 1)))
  average_time_diff_formatted=$(date -u -d @"$average_time_diff" +"%T")
  echo "During the first and last login, the user logged in on average every $average_time_diff_formatted."
done

    # Run the evaluation script on each machine
    for i in {1..3}
    do
      ip="192.168.56.$i"
      expect -c "spawn ssh vagrant@$ip \"$script\"; expect \"password:\"; send \"vagrant\r\"; interact"
    done

