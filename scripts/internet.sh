#! /bin/sh

host1=google.com
host2=facebook.com
curr_date=`date +"%Y%m%d%H%M"`

echo -n "${curr_date};"
((ping -w5 -c3 $host1 || ping -w5 -c3 $host2 ) > /dev/null 2>&1) && (echo "up" exit 0) || (echo "down" && exit 1)
