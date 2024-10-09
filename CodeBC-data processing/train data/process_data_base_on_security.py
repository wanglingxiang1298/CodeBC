#Splitting data by security attributes
import csv
import os
csv.field_size_limit(int(1e9))

file_path = "path/to/file"
file_path_safe = "path/to/safe_file"
file_path_insafe = "path/to/insafe_file"

def extract_columns(input_file, safe_file,insafe_file):
    extracted_safe_data = []
    extracted_insafe_data = []
    with open(input_file, 'r' ,encoding='utf-8') as file:
        reader = csv.reader(file)
        data = [row for row in reader]  # 读取全部数据

    for row in data:
        if row[3] != "[4]":
            extracted_insafe_data.append([row[1], row[3]])
        else:
            extracted_safe_data.append(row[1],row[3])

    with open(safe_file, 'w', newline='',encoding='utf-8') as file:
        writer = csv.writer(file)
        print(len(extracted_safe_data))
        writer.writerows(extracted_safe_data)

    with open(insafe_file, 'w', newline='',encoding='utf-8') as file:
        writer = csv.writer(file)
        print(len(extracted_insafe_data))
        writer.writerows(extracted_insafe_data)

# 调用示例
for i in range(len(os.listdir(file_path))):
    input_file = os.path.join(file_path,f'slither_audited_smart_contracts_data_{i+1}.csv')  # 输入的CSV文件名
    safe_file = os.path.join(file_path_safe,f'slither_audited_smart_contracts_data_{i+1}.csv')
    insafe_file = os.path.join(file_path_insafe,f'slither_audited_smart_contracts_data_{i+1}.csv')  # 输出的CSV文件名
    extract_columns(input_file, safe_file,insafe_file)
    print(f"file {safe_file} and {insafe_file} saved！")

print("finish")