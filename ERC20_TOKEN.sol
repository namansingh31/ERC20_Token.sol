// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract ERC20_Token {
    string public name;
    string public logo;
    uint public get_decimals;
    uint public overallSupply;
    mapping(address => uint256) public balance;
    address public holder;

    event Transfering(address indexed from, address indexed to, uint value);
    event Minting(address indexed to, uint value);

    constructor() {
        name = "ERC20TOKEN";
        logo = "ERT";
        get_decimals = 18;
        overallSupply = 1000 * 10** uint(get_decimals);
        balance[msg.sender] = overallSupply;
        holder = msg.sender;

        address[] memory addresses = new address[](2);
        addresses[0] = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
        addresses[1] = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
        uint tokensPerAddress = 1000 * 10**uint(get_decimals);

        for (uint256 i = 0; i < addresses.length; i++) {
            balance[addresses[i]] += tokensPerAddress;
            overallSupply += tokensPerAddress;
            emit Transfering(address(0), addresses[i], tokensPerAddress);
            emit Minting(addresses[i], tokensPerAddress);
        }
    }

    modifier onlyHolder() {
        require(msg.sender == holder, "Only the holder can call the funtion");
        _;
    }

    function minting(address _to, uint256 _amount) public onlyHolder{
        require(_to != address(0), "The address is invalid");
        overallSupply += _amount;
        balance[_to] += _amount;
        emit Minting(_to, _amount);
        emit Transfering(address(0), _to, _amount);
    }

    function burn(uint256 _amount) public {
        require(balance[msg.sender] >= _amount, "The balance is insufficient");
        balance[msg.sender] -= _amount;
        overallSupply -= _amount;
        emit Transfering(msg.sender, address(0), _amount);
    }

    function transfering(address _to, uint256 _amount) public {
        require(_to != address(0), "The address is invalid");
        require(balance[msg.sender] >= _amount, "The balance is insufficient");
        balance[msg.sender] -= _amount;
        balance[_to] += _amount;
        emit Transfering(msg.sender, _to, _amount);
    }
}
