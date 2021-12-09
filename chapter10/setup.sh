#docker run -it -v $PWD:/test ubuntu:focal
apt update ; apt install -y build-essential nasm gdb python

# How to build
# gcc -o test_shellcode test_shellcode.c
# nasm -f bin -o shellcode.bin shellcode.asm
# ndisasm -b 64 shellcode.bin
 
# How to exec
# ./test_shellcode shellcode.bin
# gdb --args ./test_shellcode shellcode.bin

# gdb tips
# set disassembly-flavor intel
# show disassembly-flavor
