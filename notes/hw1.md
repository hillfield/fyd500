# FYD500 - Homework I
The first number of assignments for FYD500, an introduction to linux.

## Exercise 1
Start a terminal and type the following command: 

* echo "This is the best course in the world!" 

This will print the text within the qoutes ie.

*>This is the best course in the world!*


While typing, try the following: 

* Ctrl+A - *Moves the cursor to the beginning*
* Ctrl+D - *Exits the program*
* Ctrl+E - *Moves the cursor to the end of the line.*
* Ctrl+L - *Clears the screen*

What is the difference between clear and Ctrl+L? 

*>None from what I can gather*

## Exercise 2 - RTFM
Print the day that you were born:

* date --date='TZ=Europe/Stockholm 19880610' - *It was a Friday.*

* cal -y 1752 - *30 days in September*

## Simple file manipulation
The following command will create the file bestcourse or overwrite existing file. It will add the text within the qoutes to the file.

*echo "This is the best course in the world" > bestcourse*

*pwd*, stands for print working directory. This will most likely be ~/ or /home/$USER/mycourse if the cd command hasn't been used. 

To move files, one uses mv, see the solution below for syntax. Just swap cp for mv.

To copy the file we created before, one would use cp ~/mycourse/bestcourse ~/mycourse/verybestcourse

## Exercise 4 - System information
1) whoami - *I'm batman, or in my case backefel*
2) w - *Prints other users*
3) w | awk 'FNR==3 {print $4}' - *How long the system has been idling. $\<n> is column and FNR==\<n> is row*
4) uname -r - *Displays linux revision - in my case 5.0.4-arch1-1-ARCH*


## Exercise 5 - Downloading archives
1) wget https://www.chalmers.se/en/departments/physics/research/cmt/tassin/Documents/assignment1.tar
2) tar -xvf assignment1.tar
3) tree -d ./assignment1

## Exercise 6 - Slightly less simple file manipulation
Downloaded the file with wget \<link\>

The command cat will print the contents while grep filters out the relevant rows. I.e. the command is:

*cat loremipsum | grep "Nunc euismod"*

To print the last 11 lines, type *tail -11 ./loremipsum*

To print only the files in the directory, one can use grep -v which inverts matches. So the following code lists recursively all the files and folders. The output is piped to grep which looks for things not containing "/".


*ls -R | grep -v /*




