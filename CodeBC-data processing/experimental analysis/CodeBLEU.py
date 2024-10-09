from codebleu import calc_codebleu
import pandas as pd

file_path_save_code = "path/to/result_code.csv"
file_path_save_codeBLEU = "path/to/codeBLEU.csv"

df = pd.read_csv(file_path_save_code)

def cal_codebleu(reference,prediction):
    return_result = []
    result = calc_codebleu([[reference]], [prediction], lang="javascript", weights=(0.25, 0.25, 0.25, 0.25), tokenizer=None)
    for i in result:
        return_result.append(result[i])
    return return_result

for i in range(len(df)):
    reference = df.iloc[i,0]
    for j in range(1,6):
        df.iloc[i,j] = cal_codebleu(reference, df.iloc[i,j])[0]

df.to_csv(file_path_save_codeBLEU,index=False)