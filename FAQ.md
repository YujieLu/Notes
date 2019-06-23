1. What if i get the error:
```
/bin/bash^M: bad interpreter: No such file or directory
```

this is because the line feed character of linux are different from that of Windows
Just use following cmd to remove all CR LF.
``` 
sed -i -e 's/\r$//' [your_bash_file]
```


2. can't find rospkg when run roscore


add 

```
export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages
```

to ~/.bashrc

and install pip

```
sudo apt-get install python-pip
```

reinstall roskpg

```
pip install python-rospkg
```


3. add the desktop shortcut

the path of the desktop shortcut could be

/usr/share/applications/

and

~/.local/share/applications/

to create a shortcut link

ln -s [target_file_path] [link_file_path]

4. in vim ctrl + S lock the terminal

use ctrl + Q to unlock

5. change source:
```
sudo vim /etc/apt/sources.list
```

# 远程copy
```
scp -r -P 38616 lmz@2490r3n488.zicp.vip:~/catkin_ws/src/navigator/config /home/vn/Downloads/
```
> -r 用来copy folder  
> -P 用来指定端口


# 查找所有ros进程并杀死
ps -ef | grep ros | grep -v grep | awk '{print $2}' | xargs kill -s SIGINT


# sshpass
## install
sudo apt-get install sshpass
sshpass -p "XXX" ssh user@IP


# 禁用无人值守升级

 从命令行禁用无人值守升级

技术参考：在Ubuntu 18.04服务器上设置自动安全更新（无人值守升级）。

你还可以从命令行获得相同的结果，在终端中，使用命令行文本编辑器（如nano）打开/etc/apt/apt.conf.d/20auto-upgrades文件：

sudo nano /etc/apt/apt.conf.d/20auto-upgrades

原始内容如下：

APT::Periodic::Update-Package-Lists "1";

APT::Periodic::Download-Upgradeable-Packages "1";

APT::Periodic::AutocleanInterval "0";

APT::Periodic::Unattended-Upgrade "1";

要禁用自动安全更新，请将其更改为：

APT::Periodic::Update-Package-Lists "1";

APT::Periodic::Download-Upgradeable-Packages "0";

APT::Periodic::AutocleanInterval "0";

APT::Periodic::Unattended-Upgrade "0";

要在Nano文本编辑器中保存文件，请按Ctrl+O，然后按Enter确认文件名，按Ctrl+X退出，然后重新启动计算机。


# 18.04开机自动启动
[18.04开机自动启动 不好使](https://blog.csdn.net/time_future/article/details/85805298)
[ros 开机启动 测试中](https://blog.csdn.net/baidu_28236027/article/details/53116865)
