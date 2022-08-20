#!/bin/bash
if [ $# -lt 1 ]
then
	echo "使用说明 
         -i     表示设置ip地址,默认忽略会设置为当前本机ip地址;
         -p     设置端口,默认忽略为8889端口;
         -l     设置要代理的包名,可以用设置多个包名使用逗号隔开,可忽略此参数默认代理所有包;
         -u     服务器登入的用户名,默认设置为空;
         -P     服务器登入的密码,默认设置为空;
         -s     是否立即启动,默认为 true表示启动;
         -d     表示所有参数都设为默认值;
         例子:
         adbVpnSocket.sh -h 192.168.3.4 -p 8889 -s true -u user -P 123456 -l com.kuaishou.tv,com.58,com.douyin"
	exit 1
fi
ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"|sed -n "1p"`
port="8889"
pkglist=""
startflags="true"
user=""
passwd=""
while getopts "i:p:l:u:P:s:d" arg #选项后面的冒号表示该选项需要参数
do
   case $arg in
         i)
         #echo "a's arg:$OPTARG" #参数存在$OPTARG中
         ip = $OPTARG
         ;;
         p)
         #echo "p"
         port = $OPTARG
         ;;
         l)
         pkglist=$OPTARG
         #echo "$pkglist"
         ;;
         u)
         user=$OPTARG
         #echo "$user"
         ;;
         P)
         passwd=$OPTARG
         #echo "$passwd"
         ;;
         s)
         startflags=$OPTARG
         #echo "$startflags"
         ;;
         d)
         echo "ip = $ip, port=$port, start=$startflags, pkglist='', user='', passwd=''"
         ;;
         ?)  #当有不认识的选项的时候arg为?
      echo "unkonw argument"
   exit 1
   ;;
   esac
done
cmd="adb shell am start -n com.kongdao.socks/net.typeblog.socks.MainActivity --es intent_ip $ip --ei intent_port $port --ez intent_start $startflags"
if [ ! -z $pkglist ] 
then
cmd=$cmd" --es intent_pkg_list $pkglist"
fi
if [ ! -z $user ] 
then
cmd=$cmd" --es intent_user $user"
fi
if [ ! -z $passwd ] 
then
cmd=$cmd" --es intent_passwd $passwd"
fi
echo "command: "$cmd
##结束一次进程;
adb shell am force-stop com.kongdao.socks
$cmd
