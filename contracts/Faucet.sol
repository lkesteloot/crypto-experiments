pragma solidity ^0.5.16;

contract Faucet {
    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 100000000000000000);
        
        msg.sender.transfer(withdraw_amount);
    }

    function getBalance() view public returns (uint256 balance) {
        return address(this).balance;
    }

    function () external payable {
        // Nothing.
    }
}
