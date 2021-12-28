
pragma solidity ^0.5.16;

contract GlitterCoin {
    mapping (address => uint256) mBalance;

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    constructor() public {
        mBalance[msg.sender] = 10000;
        // Spec: A token contract which creates new tokens SHOULD trigger a Transfer event with the _from address set to 0x0 when tokens are created.
    }

    function name() public pure returns (string memory) {
        return "GlitterCoin";
    }

    function symbol() public pure returns (string memory) {
        return "GLTR";
    }

    function decimals() public pure returns (uint8) {
        return 2;
    }

    function totalSupply() public pure returns (uint256) {
        // 100.00 GLTR.
        return 10000;
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return mBalance[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        if (mBalance[msg.sender] < _value) {
            // TODO: Spec says we should throw.
            return false;
        }
        mBalance[msg.sender] -= _value;
        mBalance[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public pure returns (bool success) {
        // TODO: Spec says we should throw if not auth.
        return false;
    }

    function approve(address _spender, uint256 _value) public pure returns (bool success) {
        // New value overwrites old one.
        return false;
    }

    function allowance(address _owner, address _spender) public pure returns (uint256 remaining) {
        return 0;
    }
}
