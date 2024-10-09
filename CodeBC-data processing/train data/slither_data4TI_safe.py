import csv
import pandas as pd
import os
from tqdm import tqdm
csv.field_size_limit(int(1e9))

file_path = "path/to/source_file(safe_file)"
file_path4save = "path/to/save_filename"

# prompt = """prompt"""
prompt = str(input("input your prompt:\n"))

def detection_all_file(file_path):
    file_names = []
    for file in os.listdir(file_path):
        if file.endswith('.csv'):
            file_names.append(file)
    return file_names

def exact_annotation(data):
    return_lines = []
    save_lines = []
    line = data.split('\n')
    line_t = iter(line)
    line = iter(line)
    for l,l_t in zip(line,line_t):
        l = l.strip()
        l_t = l_t.rstrip()
        if '//' in l:
            return_lines.append(l_t)
        elif l.startswith('/*'):
            while '*/' not in l:
                return_lines.append(l_t)
                l = next(line)
                l_t = next(line_t)
            return_lines.append(l_t)
        elif l == "":
            continue
        else:
            save_lines.append(l_t)
    return_lines.append('<finish>')
    return return_lines,save_lines

def process_annotation(data):
    return_lines = []
    line = iter(data)
    for l in line:
        l = l.strip()
        if '//' in l:
            return_lines.append(l.split('//')[1])
        elif l.startswith('/*'):
            data = ""
            while '*/' not in l:
                if '*' in l:
                    data = data + " " + l.split('*')[1]
                else:
                    data = data + " " + l
                l = next(line)
            return_lines.append(data)
        else:
            continue
    return return_lines

def get_all_data(df):
    all_data = []
    for i in range(len(df)):
        data = df.iloc[i, 0]
        annotation, code = exact_annotation(data)
        annotation_test = process_annotation(annotation)
        for i in range(len(annotation_test)):
            annotation_test[i] = annotation_test[i].strip()
        all_data.append(f"<s>[INST]{prompt}\n" + '\n'.join(annotation_test) +
                        "\nPlease give the contract code[/INST]" + "\n[Tag]\ncorrect\n[/Tag]" + "\n```" + '\n' + '\n'.join(code) + "\n```" + "\n[Tag]\ncorrect\n[/Tag]\n</s>")
    return all_data

file_names = detection_all_file(file_path)

df_all = []
for file in file_names:
    df = pd.read_csv(os.path.join(file_path,file))
    df_all.append(df)
    # print(f'{file}:read')

data_all = []
for df_index in range(len(df_all)):
    df = df_all[df_index]
    data_all = data_all + get_all_data(df)
    # print(f'{df_index}:finish')

# print(len(data_all))
# print(all_data[0])
with open(file_path4save,'w',newline='') as f_w:
    writer = csv.writer(f_w)
    writer.writerow(['text'])
    for i in tqdm(range(len(data_all))):
        try:
            writer.writerow([data_all[i]])
        except:
            continue

print('finish')


