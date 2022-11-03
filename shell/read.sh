#!/bin/sh
 
while read line
  do
    k=${line%=*}
    v=${line#*=}
    lsof -i:$k
    echo "$k :  $v"
 
# done  < /Users/lishun/go/src/self/test/test.sh
done  < /bin/ports.txt
