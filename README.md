```markdown
# Custom ERC20 Token (Built from Scratch)

An implementation of the ERC20 token standard written entirely from scratch in Solidity, without using OpenZeppelin.

## Overview
This project was built to understand the low-level mechanics of the ERC20 standard, specifically how mappings, nested mappings (allowances), and state transitions work.

## Features
- Standard `transfer` and `balanceOf` functions.
- `approve` and `transferFrom` to allow third-party spending (allowances).
- Custom errors for gas-efficient reverts (`InsufficientBalance`).
- Fully tested using Foundry.

## Tests
The test suite covers edge cases including:
- Initial token distribution.
- Standard transfers.
- Overdraft protection (reverting when balance is too low).
- Allowance updates and `transferFrom` logic.

Run tests:
```bash
forge test# custom-erc20-from-scratch
# custom-erc20-from-scratch
