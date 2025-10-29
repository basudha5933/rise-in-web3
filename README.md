# 📋 Verified Attendance Smart Contract

## 🧠 Project Description
This project is a simple and transparent attendance tracking system built on the blockchain using Solidity. It allows an administrator to mark attendance for participants and stores each record immutably with a timestamp. Perfect for events, workshops, or academic institutions looking to ensure auditability and trust.




<img width="1920" height="1200" alt="Screenshot 2025-10-29 135819" src="https://github.com/user-attachments/assets/c37f2e3d-5c23-4a39-8cc5-cb295074c0fd" />









## 🚀 What It Does
- Enables a designated admin to mark attendance for any participant.
- Records whether the participant was present and the exact time it was logged.
- Stores all data on-chain for transparency and verifiability.
- Allows anyone to view attendance records for audit purposes.

## ✨ Features
- ✅ **Admin-only access** to ensure secure attendance marking
- ⏱️ **Timestamped entries** for every attendance record
- 🔍 **Public view function** for transparent audits
- 🧱 **Lightweight and easy-to-understand Solidity code**
- 🌐 **Deployed on Celo Sepolia Testnet**

## 🔗 Deployed Smart Contract
Check out the live contract on Celo Sepolia Testnet:  
[0xf7E8eB4a38c849BFd8E75CA5bDf656bf9600e7F3](https://celo-sepolia.blockscout.com/address/0xf7E8eB4a38c849BFd8E75CA5bDf656bf9600e7F3)

---

## 🛠️ Smart Contract Code
```solidity
// XXX








// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttendanceRegistry {
    address public admin;

    struct Attendance {
        bool present;
        uint256 timestamp;
    }

    mapping(address => Attendance) public records;

    event AttendanceMarked(address indexed participant, bool present, uint256 timestamp);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can mark attendance");
        _;
    }

    function markAttendance(address participant, bool isPresent) public onlyAdmin {
        records[participant] = Attendance(isPresent, block.timestamp);
        emit AttendanceMarked(participant, isPresent, block.timestamp);
    }

    function getAttendance(address participant) public view returns (bool, uint256) {
        Attendance memory record = records[participant];
        return (record.present, record.timestamp);
    }
}
