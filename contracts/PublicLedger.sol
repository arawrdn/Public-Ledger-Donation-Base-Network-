// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract PublicLedger {
    address payable public owner;
    // Minimum donation amount required: 0.000001 ETH (1,000,000,000,000 Wei)
    uint public constant MINIMUM_DONATION = 1000000000000; 
    
    // Array to publicly store all donor addresses
    address[] public donorList;
    
    // Total ETH collected by the contract
    uint public totalCollected = 0;

    // Event to log successful donations
    event DonationLogged(address indexed donor, uint amount, uint newTotal);

    // --- CONSTRUCTOR ---
    constructor() {
        owner = payable(msg.sender);
    }

    // --- RECEIVE FUNCTION (DEPOSIT & LOG AUTOMATIS) ---
    // User only needs to transfer ETH directly to this contract address.
    receive() external payable {
        // 1. Requirement check: Ensure the donation meets the minimum threshold.
        require(msg.value >= MINIMUM_DONATION, "Minimum 0.000001 ETH donation required.");
        
        // 2. Log the donation details
        donorList.push(msg.sender);
        totalCollected += msg.value;
        
        // The funds stay in the contract balance until the owner withdraws them.
        emit DonationLogged(msg.sender, msg.value, totalCollected);
    }
    
    // --- OWNER WITHDRAWAL FUNCTION ---
    function withdrawAllFunds() public {
        require(msg.sender == owner, "Only owner can withdraw funds.");
        
        uint amount = address(this).balance;
        require(amount > 0, "No funds available to withdraw.");
        
        // Transfer all collected funds to the owner
        totalCollected = 0; // Reset counter
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed.");

        emit Withdrawal(owner, amount);
    }
    
    // Read function to get the current count of donors (view)
    function getDonorCount() public view returns (uint) {
        return donorList.length;
    }
    
    event Withdrawal(address indexed user, uint amount);
}
