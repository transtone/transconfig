1 手机进入lg救援模式
“手机关机后音量+和电源键同按出现llg logo 后等待5秒后手机黑屏后松开两个按键手机会自动进入救援模式”

更新手动root步骤（输入的命令是：冒号后的东东）
1、手机需要设置成USB调试模式，连接电脑（我的插入电脑时选的是充电模式，这样USB的连接显得是USB调试，慢速充电）
2、点cmd.exe，进入DOS命令模式
3、输入：adb shell touch /sdcard/g_security
4、断开手机与电脑连线
5、关闭手机的USB调试模式
6、开启手机的USB调试模式
7、连接手机与电脑
8、输入：adb shell id
屏幕会有提示，如果出现的是“uid=0(root), gid=0(root)”可以继续下一步。没有的话检查前面的步骤有无问题，如没有问题，则本方法不可行。不好意思了
9、输入：adb.exe push busybox /data/local/tmp/busybox
10、输入：adb.exe shell "chmod 755 /data/local/tmp/busybox"
11、输入：adb.exe shell /data/local/tmp/busybox mount -o remount,rw /system
12、输入：adb.exe push su /system/xbin/su
13、输入：adb.exe shell chmod 06755 /system/xbin/su
14、输入：adb.exe push SuperuserPro.apk /system/app/SuperuserPro.apk
15、输入：adb.exe push Superuser.apk /system/app/Superuser.apk
16、输入：adb shell chmod 0644 /system/app/Superuser.apk



 * The arguments which may be supplied in the recovery.command file:
 *   --send_intent=anystring - write the text out to recovery.intent
 *   --update_package=path - verify install an OTA package file
 *   --wipe_data - erase user data (and cache), then reboot
 *   --wipe_cache - wipe cache (but not user data), then reboot
 *   --set_encrypted_filesystem=on|off - enables / diasables encrypted fs


# 大G刷system
adb shell su -c "dd if=/sdcard/system.img of=/dev/block/platform/msm_sdcc.1/by-name/system bs=4096"
