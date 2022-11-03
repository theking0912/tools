
#!/bin/bash

check_port() {
        echo "正在检测端口......"
        netstat -tlpn | grep "\b$1\b"
}
if check_port 5500                                 #端口
then
        echo "端口存在"
    exit 1
else
        echo "端口死亡"
        DATE_N=`date "+%Y-%m%d %H:%M:%S"`
        echo "时间：${DATE_N}" >> check_port.log #记录死亡日志
fi



# 定义变量 process 值是 ./nbminer
process=./nbminer
# 打印 进程单一 jar进程
pid=$(ps -ef |grep $process|grep -v grep|awk '{print $2}')
if [ ! $pid ]; then 
        echo "当前已无进程"
else 
        echo "$process 当前进程 $pid , 杀掉进程 $pid"
        kill -9  $pid
        echo "进程已停止..."
fi
echo "重启进程..."
nohup ./nbminer -a ethash -o stratum+tcp://192.168.3.22:8881 -u v9999.default -log &
pid=$(ps -ef |grep $process|grep -v grep|awk '{print $2}')
echo "当前进程 $pid , 启动成功..."