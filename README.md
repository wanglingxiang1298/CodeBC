# CodeBC

CodeBC: A More Secure Large Language Model for Smart Contract Code Generation in Blockchain

  This project temporarily opens the training dataset, test dataset, and generated results, and we will follow up by disclosing our model parameters

### demo



https://github.com/user-attachments/assets/094a48ad-2d52-4afd-bb9b-f1733759f461



### Directory Structure
<!-- eg: -->

```
filetree 
├── /dataset/               
│  ├── /result_dataset/
│  │  ├── /python,C,C++/                 Task of SVEN 
│  │  │  ├──/prompt/                       Prompts of the tasks
│  │  │  ├──/codellama/                    Test results of base model codellama
│  │  │  ├──/result_with_bug_tag/          Test results with addition of a < vulnerable > tag to the original prompt
│  │  │  └──/result_with_safe_tag_25/      Test results with addition of a < security > tag to the original prompt
│  │  ├── /solidity/                     Task of CodeBC
│  │  │  ├──/BlockChain-Humaneval/         Prompts and answers of the tasks
│  │  │  ├──/codellama/                    Test results of base model codellama
│  │  │  ├──/codegen25/                    Test results of base model codegen
│  │  │  ├──/deepseek_coder/               Test results of base model deepseek_coder
│  │  │  ├──/CodeBC-CI/                    Test results of CodeBC-CI
│  │  │  ├──/CodeBC-VD/                    Test results of CodeBC-VD
│  │  │  └──/CodeBC/                       Test results of CodeBC
│  ├── /train_dataset/
│  │  ├── /SASCsmall-F/                
│  │  ├── /SASCsmall-F for CI/                    
│  │  └── /SASCsmall-F for VD/
```

### Reference
<!-- links -->


- [SVEN](https://github.com/eth-sri/sven)  
- [Slither Audited Smart Contracts](https://huggingface.co/datasets/mwritescode/slither-audited-smart-contracts)
