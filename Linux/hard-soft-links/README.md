# Inodes
inodes represent a file with its metadata in the filesystem.
a file exists solong as its inode attachments is greater than 0.

# Hard link
`ln source destination`
creates a hard link of source with the name 'destination'.
they will be attached to the same inode

# Soft Link
`ln -s source destination`
creates a soft link of source with the name 'destination'.
destination points to the source file name and location.

# Differences
```bash
echo "i am a dog" > /tmp/dog
ln /tmp/dog /tmp/hardlinked
stat -c '%i' /tmp/dog /tmp/hardlinked
echo command 'stat' produces similar inode number.
file /tmp/hardlinked
echo command 'file' identifies hardlink as a regular file
echo --- soft ---
ln -s /tmp/dog /tmp/softlinked
stat -c /tmp/dog /tmp/softlinked
echo command 'stat' produces different inode numbers.
file /tmp/softlinked
echo command 'file' idetifies file as a symbolic link.
echo ---
echo in both cases, no additional storage will be used. but for hardlink the filesystem will be able to report its `du -sh`, whilest it would be 0 for softlink.


```

# Practicality
Scenario
for file /tmp/dog, i am creating a hard link 