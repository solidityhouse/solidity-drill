// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Platform} from "../../../src/ch02/answer/Platform.a.sol";

contract PlatformTest02Answer is Test {
    Platform public platform;

    function setUp() public {
        platform = new Platform();
    }

    function test_registConcert_success() public {
        _registConcert();
    }

    // 販売チケット枚数0で登録
    function test_registConcert_fail() public {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 0;

        vm.expectRevert("SellingTickets must be greater than 0");
        platform.registConcert(dummyTitle, dummySellingTickets);
    }

    function test_getConcertInfo_success() public {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 1;

        platform.registConcert(dummyTitle, dummySellingTickets);

        uint dummyConcertId = 0;
        
        Platform.Concert memory concert = platform.getConcertInfo(dummyConcertId);
        
        assertEq(concert.title,dummyTitle);
        assertEq(concert.sellingTickets,dummySellingTickets);
        assertEq(concert.remainingTickets,dummySellingTickets);
    }

    function test_buyTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        platform.buyTicket(dummyConcertId);
    }

    // コンサートが存在しない時
    function test_buyTicket_fail_1() public {
        _registConcert();

        uint dummyConcertId = 1;

        vm.expectRevert("The concertId does not exist");
        platform.buyTicket(dummyConcertId);
    }

    // チケット保有者が再度購入したとき
    function test_buyTicket_fail_2() public {
        _registConcert();

        uint dummyConcertId = 0;

        // 一度目は成功
        platform.buyTicket(dummyConcertId);

        // 二度目は失敗
        vm.expectRevert("Tickets cannot be bought twice");
        platform.buyTicket(dummyConcertId);
    }

    // 残りチケット枚数が0枚で購入したとき
    function test_buyTicket_fail_3() public {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 1;

        platform.registConcert(dummyTitle, dummySellingTickets);

        uint dummyConcertId = 0;

        // 一度目は成功（ここで残り0枚になる）
        platform.buyTicket(dummyConcertId);

        address buyer = makeAddr("buyer");

        // 二度目は失敗
        vm.prank(buyer);
        vm.expectRevert("There are no remaining tickets available");
        platform.buyTicket(dummyConcertId);
    }

    function test_hasTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        bool hasTicket = platform.hasTicket(dummyConcertId);
        assertFalse(hasTicket);
        platform.buyTicket(dummyConcertId);
        hasTicket = platform.hasTicket(dummyConcertId);
        assertTrue(hasTicket);
    }

    function _registConcert() internal {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 10;

        platform.registConcert(dummyTitle, dummySellingTickets);
    }
}
