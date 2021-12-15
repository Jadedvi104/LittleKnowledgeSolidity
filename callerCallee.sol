pragma solidity ^0.8.6;


contract A {
    mapping(uint => uint) public objects;

    function B() public {
        objects[0] = 42;
    }
}

contract B {
    // insert address of deployed First here
    A a;

    function setAddressA(address _address) public {
        a = A(_address);
    }

    function Get() public returns(uint) {
        return a.objects(0);
    }
}
