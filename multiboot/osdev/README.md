# Hello world multiboot C

Originally from: <http://wiki.osdev.org/Bare_Bones>, should be a reasonable way to start a serious OS.

A hello world, with multiboot and a C interface.

The multiboot interface is prepared in GAS assembly.

Generates a bootable disk image by using `grub-mkrescue` on the multiboot binary.
