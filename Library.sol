// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
pragma abicoder v2;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Library is Ownable(msg.sender) {
    struct Book {
        uint id;
        string name;
        uint copies;
    }

    mapping(uint => Book) public books;

    function addBook(
        uint id,
        string memory name,
        uint copies
    ) external onlyOwner {
        books[id] = Book(id, name, copies);
    }

    function addCopies(uint id, uint numOfCopies) external onlyOwner {
        books[id].copies = numOfCopies;
    }

    function removeBook(uint id) external onlyOwner {
        delete books[id];
    }
}
