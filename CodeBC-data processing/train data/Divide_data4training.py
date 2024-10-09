#Split the task for each data into a training set, validation set, and test set
import pandas as pd
import random

file_path_safe = "path/to/safe_files"
file_path_insafe = "path/to/insafe_files"

file_path_train = "path/to/train.csv"
file_path_dev = "path/to/dev.csv"
file_path_test = "path/to/test.csv"

print('read safe file:')
df1 = pd.read_csv(file_path_safe)
print('read insafe file:')
df2 = pd.read_csv(file_path_insafe)

train_ratio = 0.8
dev_ratio = 0.9
train_size1 = int(len(df1) * train_ratio)
train_size2 = int(len(df2) * train_ratio)
dev_size1 = int(len(df1) * dev_ratio)
dev_size2 = int(len(df2) * dev_ratio)


train_data1 = df1[:train_size1]
dev_data1 = df1[train_size1:dev_size1]
test_data1 = df1[dev_size1:]
train_data2 = df2[:train_size2]
dev_data2 = df2[train_size2:dev_size2]
test_data2 = df2[dev_size2:]

merged_df1 = pd.concat([train_data1, train_data2])
merged_df2 = pd.concat([dev_data1, dev_data2])
merged_df3 = pd.concat([test_data1, test_data2])
# print(len(merged_df1),len(merged_df2))

shuffled_df1 = merged_df1.sample(frac=1, random_state=random.seed())
shuffled_df2 = merged_df2.sample(frac=1, random_state=random.seed())
shuffled_df3 = merged_df3.sample(frac=1, random_state=random.seed())


shuffled_df1.to_csv(file_path_train, index=False,encoding='utf-8')
shuffled_df2.to_csv(file_path_dev, index=False,encoding='utf-8')
shuffled_df3.to_csv(file_path_test, index=False,encoding='utf-8')

print('finish')