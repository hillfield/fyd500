# FYD500 - Homework VIII

The first number of assignments for FYD500, an introduction to linux.

## nSnake installation

Download nSnake
```
wget https://github.com/alexdantas/nSnake/archive/master.zip
```
Unpack it and read the relevant files for help with the installation.

```
unzip master.zip
```
Install nSnake into \~/.local/

```
make install DESTDIR=~/.local/nSnake 
```
Play the game

```
~/.local/nSnake/usr/bin/nsnake
```
Now, uninstall snake and compile ncurses.

```
make uninstall 
```
Downloading the file with,

```
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.1.tar.gz
```
Extracting the file with,

```
tar -xvf ncurses-6.1.tar.gz
```
Moving into the directory and configure the install and install it in
.local.
```
./configure --prefix=/chalmers/users/backefel/.local/
make
make install
```
Then I jump back to nSnake and compile it again.
```
cd ../nSnake/
make install DESTDIR=~/.local/nSnake LDFLAGS_PLATFORM=-Wl,--no-as-needed,-L/chalmers/users/$USER/.local/lib
```
The -L is to specify that it's a linker flag. The -Wl will pass the flag
--no-as-needed to gcc.
