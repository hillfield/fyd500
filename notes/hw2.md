# FYD500 - Homework II
The first number of assignments for FYD500, an introduction to linux.

## Exercise 1 - Exploring the filesystem
Use df to show information about the system. How many partitions do you have and how large are they?
Whats their purpose.

<!--
Filesystem     1K-blocks      Used Available Use% Mounted on
dev              8139440         0   8139440   0% /dev
run              8147900       900   8147000   1% /run
/dev/sdb2      243020512 154410720  76195364  67% /
tmpfs            8147900         0   8147900   0% /dev/shm
tmpfs            8147900         0   8147900   0% /sys/fs/cgroup
tmpfs            8147900        20   8147880   1% /tmp
/dev/sdb1        2093048     50516   2042532   3% /boot
tmpfs            1629580        12   1629568   1% /run/user/1000

-->

### /tmpfs 8139440 kB
tmpfs is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but stored in volatile memory instead of a persistent storage device. A similar construction is a RAM disk, which appears as a virtual disk drive and hosts a disk file system. 


### /dev 88139440 kB
dev is the location of special or device files. It is a very interesting directory that highlights one important aspect of the Linux filesystem - everything is a file or a directory. Look through this directory and you should hopefully see hda1, hda2 etc.... which represent the various partitions on the first master drive of the system. /dev/cdrom and /dev/fd0 represent your CD-ROM drive and your floppy drive. This may seem strange but it will make sense if you compare the characteristics of files to that of your hardware. Both can be read from and written to. Take /dev/dsp, for instance. This file represents your speaker device. Any data written to this file will be re-directed to your speaker. If you try 'cat /boot/vmlinuz > /dev/dsp' (on a properly configured system) you should hear some sound on the speaker. That's the sound of your kernel! A file sent to /dev/lp0 gets printed. Sending data to and reading from /dev/ttyS0 will allow you to communicate with a device attached there - for instance, your modem.

### /boot 2093048 kB
The boot partition is a primary partition that contains the boot loader, a piece of software responsible for booting the operating system. For example, in the standard Linux directory layout (Filesystem Hierarchy Standard), boot files (such as the kernel, initrd, and boot loader GRUB) are mounted at /boot/.

### / 243020512 kB
The root directory


To make the partition size more readable use the "human"-flag, 

* *df -h*

To find the remaining qouta for the user, ie. the free space on the partition that the user can use. Use the following command,

qouta -u $USER

Tried it on remote11@chalmers.se, Disk quotas for user backefel.. : none

The root directory contains:

. .. bin  boot  dev  etc  home  lib  
lib64  lost+found  media  mnt  
opt  proc  root  run  sbin  srv  
sys  tmp  usr  var

Where the . is the current directory file and .. is a link to the parent directory.

## Exercise 2 - Finding files in the file system
Locate looks in among indexed files and wheras find earches through the directories.
To find the location of the folder *coursename* one can use:

find ~ -name coursename 2 > /dev/null
locate -A coursename

If i try to find traceroute with find it will complain since I dont have access.
One can ignore the directories by sending the errors to /dev/null

find / -name traceroute 2>/dev/null searches for exact matches. That is, it will only respond with the file in /usr/bin.

locate is not case sensitive and will find all matches that have been indexed. (I made sure that the database was up to date with *sudo updatedb*.

Usually all executables are placed in /bin /usr/bin or they have a symbolic link in one of the directories.

## Exercise 3 - Viewing text files
To view the first row of loremipsum one can use 

*less loremipsum | awk 'FNR==1'*

To search with less, use standard Vim-commands. "/\<search pattern\>" will search for the search pattern in the file.

However it would be much easier to use cat loremipsum | grep -c sagittis
Which gives the answer: 54

## Exercise 4 - Creating and deleting files and directories 
If I create a directory in my homedir I won't be able to move it to a level above since I don't have permission.

Copy all files with the extension xpm from /usr/share/pixmaps to the new directory. What does xpm stand for?

file * .xpm gives us,
*x pixmap image* so it's a type of image, common in gimp.
To copy all files with extension .xpm to the current folder use:

*find /usr/share/pixmaps/ -name '*.xpm' -exec cp {} ./ \;*

Created a new directory etccopy and copied all the files from /etc to it with:

*find /etc/ -exec cp -R {} ./ \\;*

*cp -R /etc/ ./*

Created a new directory UPPERCASE whereto I copy all the files starting with a captial letter.

*find . -type f -regex ".*/[A-Z][A-Za-z]*" -exec mv -R {} ./UPPERCASE \\;*

*find . -type f -regex ".*/[a-z]*" -exec mv -R {} ./Lowercase \\;*

*sudo rm -rf ./etccopy/*

## Exercise 5 - Links and inodes
Create a hard link coursename2 that points to coursename. -check!
Check the inode number of the files

*ls -i | awk '{print $1}'*
Results in: 
11012609
11012609

Removing coursename and running more coursename will still work.

Directories normally have two hardlinks. One for "." and one for "..".

The directory "notes" has 4 inodes since it has two subdirectories.

ls -d will print the number of inodes.

Creating a hard link from 

*~/Dropbox/fyd500/.../coursename* */tmp/coursename2* 

will result in an error.
You can't create hard links to an other partition. Symbolic link will work though but it will complains when i try to run less or more. No such file or directory.

## File permisions
Change the permissions of "when" to so everyone can modify it.

To change it, one can use chmod 777 or chmod 647 which will only allow guests to have full read write execute access.

## System specifications

Change directory to /proc, what CPUs is the system running on? RAM, SWAP and drivers?

*4 CPUs (four threads)
*0 kB swap
Found in cpuinfo

Look for files ending with info such as: 

* buddyinfo
* cpuinfo
* meminfo
* pagetypeinfo
* slabinfo
* vmallocinfo
* zoneinfo


Change directory to /etc instead. How long does the system keep the log files, how many users are defined


