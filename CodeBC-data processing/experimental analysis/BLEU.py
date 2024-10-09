import os
import re
import csv
import pandas as pd
from nltk.translate.bleu_score import sentence_bleu,SmoothingFunction


source_folder_path = "path/to/Blockchain-HumanEval/codedata"
result_folder_path = "path/to/result.csv"
file_path_save_code = "path/to/result_code.csv"
file_path_save_BLEU = "path/to/BLEU.csv"

#Storing results and object code files
with open(file_path_save_code, 'w', newline='') as csvfile:
    fieldnames = ['Source File', 'Result 1', 'Result 2', 'Result 3', 'Result 4', 'Result 5']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    for filename in os.listdir(source_folder_path):
        if filename.endswith('_clean.sol'):  # Assuming the source files all end in '_clean.sol'
            source_file = filename
            with open(os.path.join(source_folder_path,source_file),'r') as f_r:
                data = f_r.read()
            result_values = []
            for i in range(5):  # Assuming that the generated result files are in order '_1.sol', '_2.sol', ... '_5.sol'.
                result_filename = filename.replace('_clean.sol', f'.txt_{i+1}.sol')
                with open(os.path.join(result_folder_path, result_filename), 'r') as file:
                    content = file.read()
                    result_values.append(content)
            writer.writerow({
                'Source File': data,
                'Result 1': result_values[0],
                'Result 2': result_values[1],
                'Result 3': result_values[2],
                'Result 4': result_values[3],
                'Result 5': result_values[4]
            })
print(f'{file_path_save_code}：finish')

def calu_BLEU(data1,data2):
    reference1 = [re.findall(r'\S+|\s', data1)]
    candidate1 = re.findall(r'\S+|\s', data2)
    smooth_func = SmoothingFunction()
    bleu_score_norm_all = sentence_bleu(reference1, candidate1, weights=(0.25, 0.25, 0.25, 0.25),
                                        smoothing_function=smooth_func.method1)
    return bleu_score_norm_all

df = pd.read_csv(file_path_save_code)
for i in range(len(df)):
    for j in range(1,6):
        df.iloc[i,j] = calu_BLEU(df.iloc[i,0],df.iloc[i,j])
        print(df.iloc[i,j])
df.to_csv(file_path_save_BLEU,index=False)