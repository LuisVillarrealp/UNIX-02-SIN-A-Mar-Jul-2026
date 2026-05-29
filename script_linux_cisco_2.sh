# dd
# syntax reference for dd.
# dd [OPTIONS] OPERAND
# changes to the home directory.
cd ~
# creates a file with zeros using /dev/zero as input.
dd if=/dev/zero of=/tmp/swapex bs=1M count=50
# clones one disk to another (dangerous command).
# dd if=/dev/sda of=/dev/sdb