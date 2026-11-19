// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../src/MyToken.sol";

contract TestMyToken is Test {
    MyToken token;
    address alice = address(0xA11CE);
    address bob = address(0xB0B);

    function setUp() public {
        token = new MyToken("Test Token", "TST", 1000 ether);
    }
    function test_InitialSupply() public view {
        assertEq(token.totalSupply(), 1000 ether);
        assertEq(token.balanceOf(address(this)), 1000 ether);
    }

    function test_Transfer() public {
        token.transfer(alice, 100 ether);
        assertEq(token.balanceOf(alice), 100 ether);
        assertEq(token.balanceOf(address(this)), 900 ether);

    }
    function test_ApproveAndTransferFrom() public {
        token.transfer(alice, 100 ether);
        vm.prank(alice);
        token.approve(bob, 50 ether);
        vm.prank(bob);
        token.transferFrom(alice, bob, 50 ether);
        assertEq(token.balanceOf(bob), 50 ether);
        assertEq(token.balanceOf(alice), 50 ether);
        assertEq(token.allowance(alice, bob), 0 ether);
        

    }
    function test_RevertWhen_TransferExceedsBalance() public {
        vm.prank(bob);
        vm.expectRevert(MyToken.InsufficientBalance.selector);
        token.transfer(alice, 1 ether);
    }



}