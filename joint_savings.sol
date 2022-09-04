pragma solidity ^0.5.0;

// Define a new contract named `JointSavings`
contract JointSavings {

    // Define contract variables.
   address payable accountOne;
   address payable accountTwo;
   address public lastToWithdraw;
   uint public lastWithdrawAmount;
   uint public contractBalance;

    //
    Define the withdraw function.
    function withdraw(uint amount, address payable recipient) public {

        //Checks the `recipient`.
       
        require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");

        //Checks if the `balance` is sufficient.
  
        require(amount <= contractBalance, "Insufficient funds!");

        // Check the `lastToWithdraw` `recipient`.
        
        if (lastToWithdraw != recipient) {
            lastToWithdraw = recipient;
        }

        // Call the `transfer` function.
        recipient.transfer(amount);

        // Set  `lastWithdrawAmount` equal to `amount`
        lastWithdrawAmount = amount;

        // Set the `contractBalance` to reflect the new balance of the contract.
        contractBalance = address(this).balance;
    }

    // Define a deposit function.
    function deposit() public payable {

        // Set the `contractBalance` to reflect the new balance of the contract.
        
        contractBalance = address(this).balance;
    }

    // Define setAccounts function.
   
    function setAccounts(address payable account1, address payable account2) public{

        // Set the values for `accountOne` and `accountTwo` respectively.
        accountOne = account1;
        accountTwo = account2;
    }

    // Add the **default fallback function so that the contract can store Ether sent from outside the deposit function.
    
    function() external payable {}
}
