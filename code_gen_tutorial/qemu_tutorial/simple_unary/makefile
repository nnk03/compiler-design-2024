C_FILE = ./file.c
S_FILE = ./file.s
OUTPUT_FILE = ./file.out

all: code_gen output_gen run

code_gen:
	mips-linux-gnu-gcc-10 $(C_FILE) -S -o $(S_FILE)

output_gen:
	mips-linux-gnu-gcc-10  $(S_FILE) -o $(OUTPUT_FILE)

run_all:
	qemu-mips -L /usr/mips-linux-gnu/ $(OUTPUT_FILE)

run : output_gen run_all







