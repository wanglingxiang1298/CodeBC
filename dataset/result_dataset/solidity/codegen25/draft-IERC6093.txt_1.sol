pragma solidity ^0.8.20;
interface IERC20Errors {
    enum ErrorTypes {
        ERC20InsufficientBalance,
        ERC20InvalidSender,
        ERC20InvalidReceiver,
        ERC20InsufficientAllowance,
        ERC20InvalidApprover,
        ERC20InvalidSpender
    }
    event Error(ErrorTypes error);
    function errorHandler(ErrorTypes error) private pure returns (bool) {
        switch (error) {
            case ErrorTypes.ERC20InsufficientBalance:
            case ErrorTypes.ERC20InvalidSender:
            case ErrorTypes.ERC20InvalidReceiver:
            case ErrorTypes.ERC20InsufficientAllowance:
            case ErrorTypes.ERC20InvalidApprover:
            case ErrorTypes.ERC20InvalidSpender:
                return true;
            default:
                return false;
        }
    }
}
interface IERC721Errors {
    enum ErrorTypes {
        ERC721InvalidOwner,
        ERC721NonexistentToken,
        ERC721IncorrectOwner,
        ERC721InvalidSender,
        ERC721InvalidReceiver,
        ERC721InsufficientApproval,
        ERC721InvalidApprover,
        ERC721InvalidOperator
    }
    event Error(ErrorTypes error);
    function errorHandler(ErrorTypes error) private pure returns (bool) {
        switch (error) {
            case ErrorTypes.ERC721InvalidOwner:
            case ErrorTypes.ERC721NonexistentToken:
            case ErrorTypes.ERC721IncorrectOwner:
            case ErrorTypes.ERC721InvalidSender:
            case ErrorTypes.ERC721InvalidReceiver:
            case ErrorTypes.ERC721InsufficientApproval:
            case ErrorTypes.ERC721InvalidApprover:
            case ErrorTypes.ERC721InvalidOperator:
                return true;
            default:
                return false;
        }
    }
}
interface IERC1155Errors {
    enum ErrorTypes {
        ERC1155InsufficientBalance,
        ERC1155InvalidSender,
        ERC1155InvalidReceiver,
        ERC1155MissingApprovalForAll,
        ERC1155InvalidApprover,
        ERC1155InvalidOperator,
        ERC1155InvalidArrayLength
    }
    event Error(ErrorTypes error);
    function errorHandler(ErrorTypes error) private pure returns (bool) {
        switch (error) {
            case ErrorTypes.ERC1155InsufficientBalance:
            case ErrorTypes.ERC1155InvalidSender:
            case ErrorTypes.ERC1155InvalidReceiver:
            case ErrorTypes.ERC1155MissingApprovalForAll:
            case ErrorTypes.ERC1155InvalidApprover:
            case ErrorTypes.ERC1155InvalidOperator:
            case ErrorTypes.ERC1155InvalidArrayLength:
                return true;
            default:
                return false;
        }
    }
}