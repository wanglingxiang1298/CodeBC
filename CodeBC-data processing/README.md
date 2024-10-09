#train data
该文件夹下为训练数据的处理，遵循CodeBC文章中描述的数据处理方式。
huggface_data.py：获取原始数据\
process_data_base_on_security.py：根据安全性拆分数据\
slither_data4codeinfiling.py：为代码填充任务提供训练数据\
slither_data4VD_(in)safe.py:为漏洞检测任务提供训练数据（分别处理安全和非安全合约代码数据）\
slither_data4TI_(in)safe.py:为标签导向的指令微调提供训练数据\
Divide_data4training.py:将数据进行组合并按照8：1：1的比例拆分为训练集、验证集和测试集


#experimental analysis
对生成结果进行计算的代码。\
BLEU:需要NLTK库(pip install nltk)\
CodeBLEU:需要codebleu库(pip install codebleu)


#对生成结果的漏洞审查需要借助Slither:
https://github.com/crytic/slither
