#!/bin/sh
 
while read line
  do
    k=${line%=*}
    v=${line#*=}
    len_pid=$(lsof -i:$k|awk '{print $2}')
    if [ ${#len_pid} -gt 4 ];then
        echo "$k is running[$v]"
    else
        echo "$k is not running[$v]"
    fi
    
 
done  < /Users/lishun/go/src/self/test/ports.txt
# done  < /bin/ports.txt

