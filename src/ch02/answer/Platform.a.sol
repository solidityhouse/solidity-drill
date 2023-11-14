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
        require(sellingTickets_ != 0,"SellingTickets must be greater than 0");

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
        require(concertId_ < concerts.length,"The concertId does not exist");
        require(!hasTicket(concertId_),"Tickets cannot be bought twice");
        require(concerts[concertId_].remainingTickets > 0,"There are no remaining tickets available");
        concerts[concertId_].remainingTickets--;
        collectedTicket[msg.sender][concertId_] = true;
    }

    function hasTicket(uint concertId_) public view returns(bool) {
        return collectedTicket[msg.sender][concertId_];
    }
}
