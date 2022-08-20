SocksDroid
==========

## SOCKS5 client for Android 5.0+ using VpnService

This is an updated version of [SocksDroid by PeterCxy](https://github.com/PeterCxy/SocksDroid) to support modern Android devices.

The project is in maintenance mode: no new features are planned, only bug fixes and compatibility upgrades.

[<img src="https://play.google.com/intl/en_us/badges/images/generic/en_badge_web_generic.png" width="200">](https://play.google.com/store/apps/details?id=net.typeblog.socks)

第一次提交来自 
https://github.com/bndeff/socksdroid
项目支持使用as3.6打开;

添加可通过 adb 命令直接打开 vpn 软件, 下面是命令例子

adb shell am start -n com.kongdao.socks/net.typeblog.socks.MainActivity --es intent_ip 192.168.3.3 --ei intent_port 8889 --ez intent_start true --es intent_user user123 --es intent_passwd 123456 --es intent_pkg_list com.vpn.ss,com.facebook,com.ent.ssd

具体可参考 adbVpnSocket.sh 脚本;