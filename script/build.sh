#!/bin/bash

cd "$(dirname "$0")" || exit
cd ../build

nasm -f elf64 ../source/nasm/hello_world.asm -o hello_world.o
ld -o hello_world -e main hello_world.o
