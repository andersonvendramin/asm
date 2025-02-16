#!/bin/bash

cd "$(dirname "$0")" || exit
cd ../build

# nasm -f elf64 ../source/nasm/disassembler/disassembler.asm -o disassembler.o
# ld -o disassembler -e main disassembler.o

nasm -f elf64 ../source/x64/nasm/hello_world.asm -o hello_world.o
ld -o hello_world -e main hello_world.o
