pragma solidity ^0.8.20;
contract Clones {
    using SafeMath for uint256;
    uint256 constant MAX_CLONES = 10000; // maximum number of clones that can be created
    mapping(uint256 => address) private clones; // mapping to store the address of each clone instance
    mapping(address => uint256[]) private saltValues; // mapping to store the salt values of each clone instance
    function clone() public returns (address) {
        require(clones.length < MAX_CLONES, "Maximum number of clones created");
        uint256 newCloneId = clones.length + 1;
        address cloneInstance = IERC20(0).newToken(newCloneId, "Clone #" + newCloneId, "C" + newCloneId);
        clones[newCloneId] = cloneInstance;
        return cloneInstance;
    }
    function cloneDeterministic(address _contractAddress, uint256 _saltValue) public returns (address) {
        require(_contractAddress.length > 0, "Contract address cannot be empty");
        require(_saltValue > 0, "Salt value cannot be zero");
        require(_saltValue <= MAX_SALT_VALUE, "Salt value exceeds maximum value");
        require(_contractAddress.balance > 0, "Contract address does not have a balance");
        require(clones[_contractAddress] == address(0), "Clone instance already exists for the contract address");
        require(saltValues[_contractAddress].length == 0 || saltValues[_contractAddress].length == 1 || _saltValue != saltValues[_contractAddress][1], "Clone instance already created with the same salt value");
        address cloneInstance = IERC20(clones[_contractAddress]).create(_saltValue);
        saltValues[_contractAddress].push(_saltValue);
        return cloneInstance;
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _saltValue, address _deployerAddress) public view returns (address) {
        require(_contractAddress.length > 0, "Contract address cannot be empty");
        require(_saltValue > 0, "Salt value cannot be zero");
        require(_saltValue <= MAX_SALT_VALUE, "Salt value exceeds maximum value");
        require(_contractAddress.balance > 0, "Contract address does not have a balance");
        require(clones[_contractAddress] != address(0), "Clone instance does not exist for the contract address");
        require(saltValues[_contractAddress].length == 1 || _saltValue == saltValues[_contractAddress][1], "Clone instance has not been created with the same salt value");
        address predictedAddress;
        if (saltValues[_contractAddress].length == 0) {
            predictedAddress = IERC20(clones[_contractAddress]).create(_saltValue);
        } else {
            predictedAddress = IERC20(clones[_contractAddress]).create(_saltValue + saltValues[_contractAddress][1]);
        }
        require(predictedAddress != _deployerAddress, "Predicted address is the deployer's address");
        return predictedAddress;
    }
}