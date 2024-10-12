// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


contract Escrow{
    address public buyer;
    address public seller;
    address public escrowAgent;
    uint256 depositAmount;
    bool isCompleted;


    constructor (address _seller, address _escrowAgent){
        seller = _seller;
        escrowAgent = _escrowAgent;
        buyer = msg.sender;
    }

    modifier onlyBuyer() {
        require(msg.sender == buyer,"You are not the buyer");
        _;
    }

    modifier onlyEscrowAgent() {
        require(msg.sender == escrowAgent,"You are not the agent");
        _;
    }

    function deposit() public payable onlyBuyer{
        require(msg.value > 0,"Amount shoul be greater than zero");
        depositAmount += msg.value;
    }

    function releaseFunds() external onlyEscrowAgent{
        require(depositAmount > 0,"No funds to release");
        require(!isCompleted,"Funds alredy released");
        isCompleted = true;

        (bool success,) = payable(seller).call{value: depositAmount}("");
        require(success,"Error releasing funds");
    }

    function refundBuyer() external onlyEscrowAgent{
        require(depositAmount > 0,"No funds ro refund");
        require(!isCompleted,"Funds already relesed");
        isCompleted = true;

        (bool success,) = payable(buyer).call{value: depositAmount}("");

        require(success,"Error refunding Funds");
    }
}