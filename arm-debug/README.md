# Arm-Debug Container

This repo demonstrates building a minimal Docker container to debug an Arm(hf) binary.

## Build the container

```
$ docker build -t arm-debug .
```

## Run the container

```
$ docker run --cap-add=SYS_PTRACE --cap-add=SYS_ADMIN --cap-add=audit_control --security-opt seccomp=unconfined --privileged -ti arm-debug 

```

## How to Cross Compile an Arm Binary

```
$ arm-linux-gnueabi-gcc bomb.c -o bomb

$ file bomb

bomb: ELF 32-bit LSB pie executable, ARM, EABI5 version 1 (SYSV), dynamically linked, interpreter /lib/ld-linux.so.3, BuildID[sha1]=4c93e107e35f8114a1c880bcd0b5a865e8aabdbd, for GNU/Linux 3.2.0, not stripped
```

## How to Debug an Arm File

Usually I split the window with ``tmux`` vertically and enable execution on the right pane and debugging on the left pane

To enable execution, start the binary with ``qemu-arm(hf)`` set a debugging port ``1234`` and specify any libraries with ``-L`` if the binary is compiled dynamically.

```
$ qemu-arm -g 1234 -L /usr/arm-linux-gnueabi/ bomb
```

Then in the other pane, start ``gdb-multiarch`` and connect to the debugging port. Everything else is normal.

```
$ gdb-multiarch bomb

pwndbg> target remote 127.0.0.1:1234
pwndbg> br

<..snipped..>
 0x400007b0 <+72>:    bl      0x40000488 <strcmp@plt>  

pwndbg> break *0x400007b0
pwndbg> c

pwndbg> x/s $r0                                                                                       │
   0x3ffff4bc:     "foo"         

pwndbg> x/s $r1
   0x40000c20:     "GoPanthers!" 
```


