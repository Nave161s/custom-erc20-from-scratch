// SPDX-License-Idntifier: MIT
pragma solidity ^0.8.19;
contract MyToken {

    // State Variables// 
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    // Mappings //
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowance;

    // Events //
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);

    // Errors //
    error InsufficientBalance();
    // Constructor //6
    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = 18;
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;



    }



    function transfer(address _to, uint256 _amount) public returns (bool){
        // Style 1: If statement
        if (balanceOf[msg.sender] < _amount) {
            revert InsufficientBalance();
        }
        
        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount);
        return true;
    }
    function approve(address _spender, uint256 _amount) public returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _amount) public returns (bool) {
        require (balanceOf[_from] >= _amount, "Insufficient balance"); 
        require (allowance[_from][msg.sender] >= _amount, "Insufficient allowance");
        if (balanceOf[_from] < _amount) { revert InsufficientBalance(); }
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        allowance[_from][msg.sender] -= _amount;
        emit Transfer(_from, _to, _amount);
        return true;

    }
}


