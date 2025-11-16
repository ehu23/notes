pragma solidity ^0.4.6; // tells version of solidity compiler this code should use

import "./someOtherContract.sol"; // used in, for instance, subclasses, and the super is in another file

contract MyContract {
    // -------State/Storage variables. Permanently stored in contract storage (AKA written on the Ethereum blockchain)
    uint num;
    struct Zombie {
        string name;
        uint dna;
    }
    // construct structs like an object: Zombie("bippy", 123)

    // -------Events/Logs emitted by the contract
    //  - way for contract to communicate that something happened on blockchain to the app front-end, which can be listening for certain events

    event NumberSetEvent(address indexCaller); // emit this in function by: 'emit NumberSetEvent(someVar);'

    // -------Functions - if retrieves state ('view' AND 'external'), costs 0 gas. But if changes state, costs gas.
    function getNum(string someParam) view returns (uint) { 
        /*
          - remove 'returns' keyword and its following parenthetical if it doesn't return anything.
          - Convention to start parameter variable name with underscore in order to differentiate from global variables. Not required.
          - Can return multiple things (thus, returns a Tuple type)
          - Functions are public by default, so anyone externally can call it. otherwise, add the 'private' keyword anywhere behind function parameters in the function header, so only functions within the contract can call it
                - Convention to have private functions prefixed with an underscore in the name
          - 'view' keyword anywhere after function name if it only views data but does not modify
          - 'pure' keyword "..." if it does not access any data, only acts on function parameters.
            */
        return num;
    }
    
    function eat() internal {
        // 'internal' is similar to 'private' but its also accessible to contracts that inherit from this contract
        // 'external' is similar to 'public' but it can ONLY be called outside the contract, not functions from inside the contract
    }
}

// Source files can contain multiple contracts. But last contract in file gets deployed.
contract CreditAccount is MyContract {
    // Is type of MyContract. Like inheritance. But does not inherit anything private!

/*
    Variable Initialization
        - uninitialized variable is set to 0s. Cannot check for validity of variable (no null/undefined type). Can only manually check (i.e. arr.length == 0)

    Type Conversion:
        - Implicit: if (1) {...} - compiler allows if no loss of info
        - Explicit: Potential Loss of info. Ex: uint24 x24 = uint24(some32BitInt)
        - Deduction: Compiler automatically infers type. var someVar = some32BitInt;

    Data Location:
       - Storage:
            - state/local variables by default. Can specify with keyword 'storage' in front of variable name
            - Peristent storage. It's a database (in the blockchain/contractCode).
            - Underneath is a key-value store. Read/write is costly.
            - Contract can manage only its own
        - Memory
            - Temporary storage. erased between external function calls to your contract. Can specify with keyword 'memory'
            - default for variables declared inside functions, arguments of functions. Addressable at byte level.
            - Ex: uint[] memory memoryArray; // Put array into memory part of data location.
            - Ex: uint[] storage ptr1 = someArrayInStorage; // Creates a reference/pointer (like javascript) to the array in storage. 'memory' would make a copy of it.
        - Calldata
            - Temporary storage, non-modifiable.
            - EVM code execution

Types: (can be private/public, private by default)
    Integer (int, uint) - specified in 8 bit increments.
        Default: int = int256
*Note: value types are always passed by value

    Address (address) - 20 byte ethereum address. A value type.
        - can get members from the address - address1.balance (returns balanace in wei), address1.transfer(10) (sends 10 wei to address1)

*/
    // Static Arrays: 
    bool[10] array;
    bool ele = array[4];
    uint len = array.length;
    array.length = 6; // Works if its a dynamic array, and size can be changed at runtime assuming its on 'storage'

    // Dynamic Arrays:
    int8[] array; // if array is created with 'memory' keyword, it cannot be resized after initializing its length, as opposed to ones on 'storage', which use .push()
    array = new int8[](10); //initialize array to size 10.
    array.push(5);
    array = [1,2,4];

    // The Byte - type
    byte b1; // single addressable byte
    byte[15] bData; //static array //dynamic: byte[] data;
    bytes32 fixedArr; // read only. Not write. 32 byte array. //dynamic: bytes data; 
    // Note: can assign fixed size bytes array to smaller bytes array but not bigger, i.e. bytes16 smaller; bData = smaller;

    // String
    //  - UTF-8 encoded string of arbitrary length, dynamically sized. similar to bytes type.
    // Conversions:
    string data = string(dynamic_bytes_array);
    string data = string(fixedLengthBytes_array);
    bytes data = bytes(string_data);
        // differences: fixed length not supported for strings. cannot use index bracket notation on strings. string cannot be expanded (no push())
    // Note: check for equality on strings must check their hashes to be the same, since there is no default string equalitator
    //      keccak256(abi.encodePacked(someStringVar)) == keccak256(abi.encodePacked("hi"))
    
    // Tuple - a list of objects
    var(name, age) = getOwnerInfo();
    (a,b,c) = multipleReturns(); // works if a, b, c are previously declared and are the right types.
    var(name, ) = getOwnerInfo(); // you may skip a variable in a tuple

    // Mapping
    mapping (address => uint) public accountBalance;
    

}

// Interface - how to interact with other contracts
contract NumInterface {
    // declare the functions you want to interact with
    function getNum(address _myAddress) public view returns (uint);
}
// ...... in another contract below ....
contract myContract {
    address NumInterfaceAddr = 0xab391 // get this manually from online source
    NumInterface numContract = NumInterface(NumInterfaceAddr); // you can use numContract public stuff as if it was imported in
    numContract.getNum(0x9399130);
}


/*
More Notes:
 -Global Variables available to all functions:
    'msg.sender' ===== address of the external/contract account who called the current function

 -'require()' function - throws error if condition is false. Ex: require(1 == num);

*/
