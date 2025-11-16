import "./erc721.sol";

contract myContract {

    address private _addr;

    // Constructor
    constructor() internal {
        _addr = msg.sender;
    }

    // Function modifier - placed at end of a function's header. checks requirements prior to that function's execution.
    // 
    modifier onlyOwner(uint _age) {
        require(isOwner() && age > 1);
        _; // this is syntax for 'jumping' back to the function this modifer was placed in
    }

    // 'payable' modifier - when you want the function to receive ether. Mandatory for functions expecting ether as input.
    function buy() external payable {
        require(msg.value == 0.001 ether); // msg.value is the amount of ether inputted. 'ether' is a built-in integer unit.
        transferTo(msg.sender);
    }

    // Withdraws:
    function withdraw() external onlyOwner {
        address _owner = owner();
        _owner.transfer(address(this).balance); // '.transfer()' transfers ether to the address that called it. 'address(this).balance' is the amount of ether stored on the contract.
    }

    // Global variables
    now // timestamp in seconds since Jan. 1st 1970
    5 minutes // seconds of 5 minutes (300). There is also minutes, hours, days, weeks, years. Must be plural (1 days)
}


    // Conforming to ERC721 token
contract tokenTest is myContract, ERC721 { //inherit from more than one contract
    // overwrite the standard functions inherited from ERC721
}


/*
  Libraries:
    - special type of contract, imported like any other contract. Can attach functions to native data types like uints.
    - "tack on functions for specific data types" from a library like so: using SafeMath for uint256;

Note: 'assert' is similar to 'require' except that assert will not refund the user the rest of their gas when it fails. Assert is used more when something has gone horribly wrong.

