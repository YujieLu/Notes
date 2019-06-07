# setting up serial

1. setup serial in vmware
> * add two serial ports, set the first one as server, the second as client  
> * use the same pipe, such as: \\.\pipe\com_1  
> * For server, check Yield CPU on poll

2. check all serial ports in linux
```
	dmesg | grep tty
```

3. find corresponding serial ports
> * we can use output file function of the vmware to test

4. change the permission of corresponding serial ports
```
	sudo chmod 666 /dev/ttyS0
	sudo chmod 666 /dev/ttyS1
```

add current user to dialout group
```
sudo usermod -a -G dialout [current user]
```


5. test it! open one terminal first, and listen to the first serial port

``` 
	cat /dev/ttyS1
```

open another terminal, send message to the second serial port

```
	echo test > /dev/ttyS2
```
