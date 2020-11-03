
# Script for installing tmux on systems where you don't have root access.
# tmux will be installed in $TARGET_DIR/local/bin.
# It's assumed that wget and a C/C++ compiler are installed.

# exit on error
set -e

TMUX_VERSION=3.1c
LIBEVENT_VERSION=2.1.8-stable
NCURSES_VERSION=6.1


TARGET_DIR=/data/vemeraud/tools/tmux-3.1c


# create our directories
mkdir -p $TARGET_DIR/local $TARGET_DIR/tmux_tmp
cd $TARGET_DIR/tmux_tmp

# download all the files
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
wget https://github.com/libevent/libevent/releases/download/release-${LIBEVENT_VERSION}/libevent-${LIBEVENT_VERSION}.tar.gz
wget https://ftp.gnu.org/pub/gnu/ncurses/ncurses-${NCURSES_VERSION}.tar.gz

############
# libevent #
############
tar xvzf libevent-${LIBEVENT_VERSION}.tar.gz
cd libevent-${LIBEVENT_VERSION}
./configure --prefix=$TARGET_DIR/local --disable-shared
make
make install
cd ..

############
# ncurses  #
############
tar xvzf ncurses-${NCURSES_VERSION}.tar.gz
cd ncurses-${NCURSES_VERSION}
./configure --prefix=$TARGET_DIR/local
make 
make install
cd ..

############
# tmux     #
############
tar xvzf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure CFLAGS="-I$TARGET_DIR/local/include -I$TARGET_DIR/local/include/ncurses" LDFLAGS="-L$TARGET_DIR/local/lib -L$TARGET_DIR/local/include/ncurses -L$TARGET_DIR/local/include"
CPPFLAGS="-I$TARGET_DIR/local/include -I$TARGET_DIR/local/include/ncurses" LDFLAGS="-static -L$TARGET_DIR/local/include -L$TARGET_DIR/local/include/ncurses -L$TARGET_DIR/local/lib" make
cp tmux $TARGET_DIR/local/bin
cd ..

cd $TARGET_DIR

# cleanup
rm -rf $TARGET_DIR/tmux_tmp

echo "$TARGET_DIR/local/bin/tmux is now available. You can optionally add $TARGET_DIR/local/bin to your PATH."

# for the in order to add to the .bashrc (for /sh/bash) comment-in below line
# echo 'export PATH="$TARGET_DIR/local/bin:$PATH"' >> $TARGET_DIR/.bashrc
