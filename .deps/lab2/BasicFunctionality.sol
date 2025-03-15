// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PersonRegistry {
    struct Person {
        string firstName;
        string lastName;
    }

    mapping(address => Person) private persons;
    
    event PersonAdded(address indexed user, string firstName, string lastName);

    function addPerson(string memory _firstName, string memory _lastName) public {
        persons[msg.sender] = Person(_firstName, _lastName);
        emit PersonAdded(msg.sender, _firstName, _lastName);
    }

    function getPerson(address _addr) public view returns (string memory, string memory) {
        require(bytes(persons[_addr].firstName).length > 0, "Person not found");
        return (persons[_addr].firstName, persons[_addr].lastName);
    }
}
