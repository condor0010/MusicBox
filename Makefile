install:
	nasm -felf64 main.S
	ld main.o
clean:
	rm a.out
