// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Platform {
    struct Concert {
        string title;
        uint sellingTickets;
        uint remainingTickets;
    }

    Concert[] concerts;
    mapping(address buyer => mapping(uint concertId => bool collected)) collectedTicket;

    function registConcert(
        string calldata title_,
        uint sellingTickets_
    ) external {
        Concert memory concert = Concert({
            title: title_,
            sellingTickets: sellingTickets_,
            remainingTickets: sellingTickets_
        });

        concerts.push(concert);
    }

    function getConcertInfo(
        uint concertId_
    ) external view returns (Concert memory) {
        return concerts[concertId_];
    }

    function buyTicket(uint concertId_) external {
        concerts[concertId_].remainingTickets--;
        collectedTicket[msg.sender][concertId_] = true;
    }

    function hasTicket(uint concertId_) external view returns(bool) {
        return collectedTicket[msg.sender][concertId_];
    }
}
