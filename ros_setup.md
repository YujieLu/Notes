# set up ros connection
1. add server hostname to client /etc/hosts

```
	sudo gedit /etc/hosts
```

/etc/hosts example:

```
127.0.0.1	localhost
127.0.1.1	ubuntu
192.168.3.100	vn1-desktop
```

2. set ROS_MASTER_URI on client by adding following code to ~/.bashrc

```
export ROS_MASTER_URI=http://192.168.3.100:11311
```
