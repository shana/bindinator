#!/bin/sh

autoreconf  -i --force --warnings=none -I . -I m4
./configure --enable-maintainer-mode $*
