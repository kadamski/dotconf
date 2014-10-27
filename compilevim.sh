cd ~/BUILD/
hg clone https://code.google.com/p/vim/
cd vim
./configure --with-features=huge --enable-rubyinterp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7-config --enable-perlinterp --enable-luainterp --enable-gui=gnome2 --enable-cscope --prefix=${HOME}/vim/ 
make VIMRUNTIMEDIR=${HOME}/vim/runtime/
make install
