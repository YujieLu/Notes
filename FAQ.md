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
