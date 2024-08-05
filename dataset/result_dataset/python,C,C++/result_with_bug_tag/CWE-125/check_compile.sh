#!/bin/bash

# 创建一个临时目录用于编译测试
TEMP_DIR=$(mktemp -d)
UNCOMPILABLE_FILES=""

for file in *.c; do
    gcc -c "$file" -o "$TEMP_DIR/$(basename "$file" .c).o" 2>/dev/null
    if [ $? -ne 0 ]; then
        echo "Uncompilable: $file"
        UNCOMPILABLE_FILES="$UNCOMPILABLE_FILES $file"
    fi
done

# 清理临时目录
rm -rf "$TEMP_DIR"

# 输出不可编译文件列表并删除不可编译的文件
if [ ! -z "$UNCOMPILABLE_FILES" ]; then
    echo "Uncompilable files: $UNCOMPILABLE_FILES" > uncompilable_files.txt
    for file in $UNCOMPILABLE_FILES; do
        rm -f "$file"
    done
else
    echo "All files are compilable" > uncompilable_files.txt
fi