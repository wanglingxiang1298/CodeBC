#train data
This folder contains the processing of the training data, following the data processing described in the CodeBC article.
huggface_data.py: get raw data\
process_data_base_on_security.py: split data based on security\
slither_data4codeinfiling.py: providing training data for code-filling tasks\
slither_data4VD_(in)safe.py: provide training data for vulnerability detection task (separate code data for secure and non-secure contracts) \
slither_data4TI_(in)safe.py: providing training data for label-oriented instruction fine-tuning\\
Divide_data4training.py: combines data and splits it into training, validation and testing sets in a ratio of 8:1:1.


#experimental analysis
Code that performs calculations on the generated results. \
BLEU:Requires NLTK library (pip install nltk)\
CodeBLEU:requires codebleu library (pip install codebleu)


#Vulnerability review of the generated results requires Slither.
https://github.com/crytic/slither