Generate smart contract code that meets the following requirements:
Programming with solidity ^ version number 0.8.20
Implement the interface contract called IERC777Recipient, which defines a function to receive the transfer of ERC777 tokens.
The following function needs to be completed with the following function name and function:
tokensReceived: This function is used to receive the transfer of ERC777 tokens. It accepts six parameters: operator: the address where the transfer is to be performed. from: the original address where the tokens are to be transferred to. to: the destination address where the tokens are to be transferred to. amount: the number of tokens to be transferred. userData: additional user data. operatorData: additional operator data. This function does not have a return value, but when it is called, it performs some specific logic to process the received token transfer.
Please give the contract code
[/INST]
[TAG]
bug
[/TAG]