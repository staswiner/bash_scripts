#!/bin/bash

echo "creating 80k file /tmp/dog"
dd if=/dev/zero of=/tmp/dog bs=4k count=20 > /tmp/dog
echo "--- hard ---"
ln /tmp/dog /tmp/hardlinked

echo "= stat inode ="
stat -c '%i' /tmp/dog /tmp/hardlinked
echo -e command 'stat' produces similar inode number.\\n

echo "= file ="
file /tmp/hardlinked
echo -e command 'file' identifies hardlink as a regular file\\n

echo "= du -sh ="
du -sh /tmp/hardlinked 
echo -e command 'du' provides size for the hardlink\\n

echo --- soft ---
ln -s /tmp/dog /tmp/softlinked

echo "= stat inode ="
stat -c '%i' /tmp/dog /tmp/softlinked
echo -e command 'stat' produces different inode numbers.\\n

echo "= file ="
file /tmp/softlinked
echo -e command 'file' idetifies file as a symbolic link.\\n

echo "= du -sh ="
du -sh /tmp/softlinked
echo -e command 'du' provides 0 as the size for softlink.\\n

echo ---
echo in both cases, no additional storage will be used. but for hardlink the filesystem will be able to report its 'du -sh', whilest it would be 0 for softlink.

rm /tmp/dog /tmp/hardlinked /tmp/softlinked
