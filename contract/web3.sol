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
