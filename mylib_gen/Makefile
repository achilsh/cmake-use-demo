# 定义编译器
CC = g++

# 定义编译选项
CFLAGS = -c -fPIC -Wall -Werror  -std=c++11 -I.

# 定义链接选项
LDFLAGS = -shared

# 定义源文件和目标文件名
SRC =mylib.cc
OBJ = $(SRC:.cc=.o)
TARGET = libmylib.so

# 默认目标，执行make时默认执行的规则
all: $(TARGET)

# 规则：从源文件编译生成目标文件
$(OBJ): $(SRC)
	$(CC) $(CFLAGS) $< -o $@

# 规则：链接目标文件生成动态库
$(TARGET): $(OBJ)
	$(CC) $(LDFLAGS) $^ -o $@

# 清理规则，用于删除生成的目标文件和动态库
clean:
	rm -f $(OBJ) $(TARGET)

# 伪目标，用于避免和文件重名冲突
.PHONY: all clean