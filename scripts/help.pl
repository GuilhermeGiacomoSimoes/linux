#/usr/bin/perl

use strict;
use warnings;

my $option_help = $ARGV[0];
print $option_help;

if ($option_help eq "qemu-debug") {
	print "
add this parameters in /etc/mkinitcpio.conf:
MODULES=(ext4)
HOOKS=(base systemd modconf sd-vconsole filesystems block keyboard)
# Unlocking the root account
echo 'root:x:0:0:root:/root:/bin/sh' > /tmp/passwd
echo 'root:\$6\$drlHj0v2/B7liRyL\$YH0ZHsG4d05mS6moBPkdzI5dlt9RjrPbWTCwDk7r5ZCWIGHFEx9A/atj/hPImYPq7qGzi8zGHOKqRgfHSfq7b/:18611:0:99999:7:::' > /tmp/shadow
add_file /tmp/passwd /etc/passwd 0644
add_file /tmp/shadow /etc/shadow 0600


run this commando:
fakeroot 

create a initramfs
mkinitcpio -k /boot/vmlinuz-linux -c /etc/mkinitcpio.conf -g initramfs.img


exit fakeroot with this command:
exit


dd if=/dev/zero of=rootfs.img bs=1M count=2048  # 2GB de disco

mkfs.ext4 rootfs.img

mkdir mnt

sudo mount rootfs.img mnt

sudo pacstrap mnt/ base

sudo passwd --root /mnt root

sudo umount rootfs.img 

qemu-system-x86_64 -kernel /boot/vmlinuz-linux -initrd initramfs.img -m 2G -machine q35 -device ich9-ahci,id=sata -drive id=disk,file=rootfs.img,if=none,format=raw -device ide-hd,drive=disk,bus=sata.0 -append \"root=/dev/sda console=ttyS0\" -nographic -monitor tcp:5900,server,nowait
";
}

elsif ($option_help eq "create-patch") {

}

elsif ($option_help eq "help") {
	help();
}

else {
	help();
}

sub help {

}
