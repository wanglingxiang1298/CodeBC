import csv
import pandas as pd
import os
from tqdm import tqdm
csv.field_size_limit(int(1e9))

file_path = "path/to/source_file(insafe_file)"
file_path4save = "path/to/save_filename"

# prompt = """prompt"""
prompt = str(input("input your prompt:\n"))

def detection(data):
    lines = data.split('\n')
    line_iter1 = iter(lines)
    for line in line_iter1:
        line = line.strip()
        if line.startswith('pragma'):
            try:
                while True:
                    line = next(line_iter1).strip()
                    if line.startswith('pragma'):
                        return 1
            except StopIteration:
                break
    return 0

def remove_comments(data):
    lines = data.split('\n')
    cleaned_lines = []
    line_iter1 = iter(lines)
    line_iter2 = iter(lines)
    for line ,line_t in zip(line_iter1,line_iter2):
        line = line.rstrip()
        line_t = line_t.strip()
        if line_t.startswith('//'):
            continue

        if line_t.startswith('/*') or '*' in line_t:
            while '*/' not in line_t and '*' not in line_t and line:
                line = next(line_iter1).rstrip()
                line_t = next(line_iter2).strip()
            continue

        if line_t == '':
            continue

        cleaned_lines.append(line)

    cleaned_data = '\n'.join(cleaned_lines)
    return cleaned_data

df = []
print("read files:")
for i in tqdm(range(len(os.listdir(file_path)))):
    df_in = pd.read_csv(os.path.join(file_path,f'slither_audited_smart_contracts_data_{i+1}.csv'))
    df.append(df_in)
    print(f'{i}文件读取完成')

print("save files:")
with open(file_path4save, 'w', newline='',encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['text','slither'])
    for i in tqdm(range(len(df))):
        for j in range(len(df[i])):
            row1 = df[i].iloc[j, 0]
            sliter = df[i].iloc[j,1]
            if detection(row1) != 1:
                row = remove_comments(row1)
                row_with_tags = ["<s>" + "[INST]" + prompt + "```\n" + row + "\n```\n" + "[/INST]\n","[Tag]\n" + "bug" + "\n[/Tag]\n"  + '</s>']
                write_line = ''.join(row_with_tags)
                writer.writerow([write_line,sliter])

print("finish")