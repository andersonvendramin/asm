#!/bin/bash

SCRIPT_SOURCE="${BASH_SOURCE[0]}"
SCRIPT_PATH="$(realpath "$SCRIPT_SOURCE")"
SCRIPT_DIRECTORY="$(dirname "$SCRIPT_PATH")"

cd "$SCRIPT_DIRECTORY"
cd ../build
nasm -felf64 ../source/x64/nasm/hello_world.asm -o ./hello_world.o
ld hello_world.o -e main -o ./hello_world
