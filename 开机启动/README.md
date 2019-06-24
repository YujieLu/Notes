# 18.04开机自动启动

## 相关link
[18.04开机自动启动](https://blog.csdn.net/time_future/article/details/85805298)  
[ros 开机启动](https://blog.csdn.net/baidu_28236027/article/details/53116865)  


## 我的方法
尝试了多种方法，包括
* 修改/etc/rc.local　并启用rc-local.service 
  > 确实会运行rc.local文件，但总是报错找不到roslaunch命令，通过修改PATH或source相关
  setup.bash 依然无法改变此时的PATH
* 修改/etc/profile 或者　~/.profile
  > 同样脚本会被运行，但当自动登录生效时与rc.local有相同的问题。
* 使用robot_upstart,我测试唯一可以行的方案（使用非root账户启动服务）
  1) 安装robot_upstart
   ```
        sudo apt-get install ros-melodic-robot-upstart -y
   ```
  2) 安装运行脚本
   ```
        rosrun robot_upstart install --user $USER --logdir $HOME/.ros/log navigator/launch/run_all_withoutrviz.launch
   ```
  3) 修改/usr/sbin/navigator-start,roslaunch 前不使用setuidpid,[示例](https://github.com/YujieLu/Notes/blob/master/%E5%BC%80%E6%9C%BA%E5%90%AF%E5%8A%A8/navigator-start)

  4) 修改/lib/systemd/system/navigator.service,在[Service]后面添加User=vn,可以使用下列代码自动生成
   ```
        echo "
        [Unit]
        Description=\"bringup navigator\"
        After=network-online.target
        Wants=network-online.target

        [Service]
        Type=simple
        ExecStart=/usr/sbin/navigator-start
        User=$USER

        [Install]
        WantedBy=multi-user.target" > ~/navigator.service

        sudo mv ~/navigator.service /lib/systemd/system/navigator.service
   ```

  5) 刷新daemon设置，启动服务 
    ```
        sudo systemctl daemon-reload && sudo systemctl start navigator
    ```

  6) 重启系统，测试是否成功，如果下列命令输出不为空，则成功
   ```
        ps -ef |grep ros |grep -v grep
   ```
## 自动登录
修改/etc/gdm3/custom.conf，在[daemon]后面添加下列代码即可

```
     AutomaticLogin=username
     AutomaticLoginEnable=True
```



