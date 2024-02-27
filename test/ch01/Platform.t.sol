// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Platform} from "../../src/ch01/Platform.sol";

contract PlatformTest01 is Test {
    // テストしたいコントラクトを格納
    Platform public platform;

    // setupはテストごとに呼び出される
    function setUp() public {
        // テストしたいコントラクトをインスタンス化（デプロイ）して代入
        platform = new Platform();
    }

    // コンサート登録の正常系
    function test_registConcert_success() public {
        _registConcert();
    }

    // コンサート情報取得の正常系
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

    // チケット購入の正常系
    function test_buyTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        // platform.buyTicket(dummyConcertId);
    }

    // チケット保有確認の正常系
    function test_hasTicket_success() public {
        _registConcert();

        uint dummyConcertId = 0;

        // bool hasTicket = platform.hasTicket(dummyConcertId);
        // assertFalse(hasTicket);
        // platform.buyTicket(dummyConcertId);
        // hasTicket = platform.hasTicket(dummyConcertId);
        // assertTrue(hasTicket);
    }

    // コンサート登録の汎化処理
    function _registConcert() internal {
        string memory dummyTitle = "dummyTitle";
        uint dummySellingTickets = 10;

        // platform.registConcert(dummyTitle, dummySellingTickets);
    }
}
