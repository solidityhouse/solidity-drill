// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Platform} from "../../src/ch01/Platform.sol";

contract PlatformTest01 is Test {
    Platform public platform;

    function setUp() public {
        platform = new Platform();
    }

    function test_registConcert_success() public {
        _registConcert();
    }

    function test_getConcertInfo_success() public {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 1;

        // platform.registConcert(dummyTitle, dummySellingTickets);

        uint dummyConcertId = 0;
        
        // Platform.Concert memory concert = platform.getConcertInfo(dummyConcertId);
        
        // assertEq(concert.title,dummyTitle);
        // assertEq(concert.sellingTickets,dummySellingTickets);
        // assertEq(concert.remainingTickets,dummySellingTickets);
    }

    function test_buyTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        // platform.buyTicket(dummyConcertId);
    }

    function test_hasTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        // bool hasTicket = platform.hasTicket(dummyConcertId);
        // assertFalse(hasTicket);
        // platform.buyTicket(dummyConcertId);
        // hasTicket = platform.hasTicket(dummyConcertId);
        // assertTrue(hasTicket);
    }

    function _registConcert() internal {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 10;

        // platform.registConcert(dummyTitle, dummySellingTickets);
    }
}
