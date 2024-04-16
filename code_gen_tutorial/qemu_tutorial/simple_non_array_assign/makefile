C_FILE = ./simple_non_array_assign.c
S_FILE = ./simple_non_array_assign.s
OUTPUT_FILE = ./simple_non_array_assign.out

all: code_gen output_gen run

code_gen:
	mips-linux-gnu-gcc-10 $(C_FILE) -S -o $(S_FILE)

output_gen:
	mips-linux-gnu-gcc-10  $(S_FILE) -o $(OUTPUT_FILE)

run:
	qemu-mips -L /usr/mips-linux-gnu/ $(OUTPUT_FILE)






