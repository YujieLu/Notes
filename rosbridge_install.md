
Install rosbridge_suite & robotlibjs


1. install rosbridge_suite

```
sudo apt-get install ros-melodic-rosbridge-suite
```


2. install nodejs

```
curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs
```

3. download robotlibjs

install using 
```
npm install 
```

reboot the computer

after reboot, I can't run roscore.

to solve this,

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


