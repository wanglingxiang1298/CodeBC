# 生成目标：all
all: compile

# 编译所有的 .c 文件为 .o 文件
compile: $(patsubst %.c,%.o,$(wildcard *.c))

# 生成所有的 .o 文件
%.o: %.c
	gcc -c $< -o $@

# clean 目标，用于清理生成的文件
clean:
	rm -f *.o
