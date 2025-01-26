// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract IdentityVerification {
    mapping(address => bool) public verifiedUsers;

    event UserVerified(address indexed user);

    function verifyIdentity(address user) public {
        require(!verifiedUsers[user], "User already verified.");
        verifiedUsers[user] = true;
        emit UserVerified(user);
    }

    function isVerified(address user) public view returns (bool) {
        return verifiedUsers[user];
    }
}
