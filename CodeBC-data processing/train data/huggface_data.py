#Getting the raw data 获取原始数据
from datasets import load_dataset
import pandas as pd
import os

#Defining the Storage Location Catalog 定义存储位置目录
file_path = "path/to/file_dic"

dataset = load_dataset('mwritescode/slither-audited-smart-contracts', 'small-multilabel')

data = dataset['train']

#Save data in batches to multiple files (CSV) 将数据分批次保存到多个文件（CSV）
batch_size = 1000  #Number of data entries per file 每个文件的数据条数
num_files = len(data) // batch_size + 1  # 文件数量
for i in range(num_files):
    start_index = i * batch_size
    end_index = (i + 1) * batch_size
    batch_data = data[start_index:end_index]
    batch_df = pd.DataFrame(batch_data)
    file_name = f'slither_audited_smart_contracts_data_small{i+1}.csv'  #filename 文件名
    batch_df.to_csv(os.path.join(file_path,file_name), index=False)
    print(f"file {file_name} saved！")

print("Data has been successfully saved to multiple files! 数据已成功保存到多个文件中！")
