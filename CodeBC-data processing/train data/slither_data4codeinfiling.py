import csv
import pandas as pd
import random
import os
from tqdm import tqdm
csv.field_size_limit(int(1e9))

file_path = "path/to/source_file(safe_file)"
file_path4save = "path/to/save_filename"

#Detect if only one smart contract code is included
def detection_mp(data):
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

#Cleaning the data and removing annotated information
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

#Split code data
def delete_random_characters(string,seed = 0):
    # Calculate the number of characters to be deleted
    random.seed(seed + 42)
    detect_count = int (len(string) / 5)
    del_s1 = detect_count
    del_e1 = detect_count * 2
    del_s2 = detect_count * 3
    del_e2 = detect_count * 4
    # Generate the index of the character to be deleted
    delete_indexes_s = random.randint(del_s1,del_e1)
    delete_indexes_e = random.randint(del_s2,del_e2)
    delete_indexes = []
    for i in range(delete_indexes_s,delete_indexes_e):
        delete_indexes.append(i)
    # print(delete_indexes)
    # Delete characters according to index
    new_string_pre = ''.join(char for i, char in enumerate(string) if i < delete_indexes_s)
    new_string_delet = ''.join(char for i, char in enumerate(string) if i in delete_indexes)
    new_string_suf = ''.join(char for i, char in enumerate(string) if i >= delete_indexes_e)
    # new_string = [new_string_pre,new_string_suf,new_string_delet]
    return new_string_pre,new_string_delet,new_string_suf

df = []
print("read files:")
for i in tqdm(range(len(os.listdir(file_path)))):
    df_in = pd.read_csv(os.path.join(file_path,f'slither_audited_smart_contracts_data_{i+1}.csv'))
    df.append(df_in)
    # print(f'{i+1}read finish')

print("save files:")
with open(file_path4save, 'w', newline='',encoding='utf-8') as file:
    writer = csv.writer(file)
    writer.writerow(['text'])
    for i in tqdm(range(len(df))):
        for j in range(len(df[i])):
            row1 = df[i].iloc[j, 0]
            if detection_mp(row1) != 1:
                row = remove_comments(row1)
                for k in range(5):
                    try:
                        pre, dele, suf = delete_random_characters(row,seed=k)
                        # row_replaced, replaced_row = replace_text_2(row)
                    except Exception as e:
                        print(f' error occurred: {e}')
                    # print(replaced_row)
                    row_with_tags = ["<s>▁<PRE>" + pre + "▁<SUF>" + suf + "▁<MID>" + dele + "\n▁<EOT></s>"]
                    write_line = ''.join(row_with_tags)
                    writer.writerow([write_line])
        # print(f'{i+1} finished')

print("finish")