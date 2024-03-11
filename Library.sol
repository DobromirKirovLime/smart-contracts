/// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
pragma abicoder v2;

import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";

contract Library is Ownable {
    struct Book {
        uint id;
        string name;
        uint copies;
    }

    Book public book;
    Book[] public books;

    function addBook(
        uint id,
        string memory name,
        uint copies
    ) external onlyOwner {
        book = Book(id, name, copies);
        books.push(book);
    }

    function addCopies(uint id, uint numOfCopies) external onlyOwner {
        for (uint i = 0; i < books.length; i++) {
            if (id == books[i].id) {
                books[i].copies = numOfCopies;
                break;
            }
            continue;
        }
    }

    function removeBook(uint id) external onlyOwner {
        for (uint i = 0; i < books.length; i++) {
            if (id == books[i].id) {
                delete books[i + 1];
                break;
            }
            continue;
        }
    }

    mapping(uint => Book) public booksArray;

    function browseBooks() public view returns (Book[] memory) {}
}
