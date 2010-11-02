#!/bin/sh
dosbox -c "mount c: `pwd`" -c 'set PATH=Z:\;C:\DOS' -c 'c:' -c 'cd\zargon' -c 'call zargon.bat' -c 'exit'
