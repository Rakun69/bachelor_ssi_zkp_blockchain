// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IdentityVerification {
    event ProofVerified(bool success);

    function verifyProof(
        uint256[2] memory a,
        uint256[2][2] memory b,
        uint256[2] memory c,
        uint256[1] memory input
    ) public {
        bool success = verify(a, b, c, input);
        emit ProofVerified(success);
    }

    function verify(
        uint256[2] memory a,
        uint256[2][2] memory b,
        uint256[2] memory c,
        uint256[1] memory input
    ) internal pure returns (bool) {
        // Hier würde die eigentliche ZKP-Verifikation stattfinden
        // Zum Testen geben wir einfach true zurück
        return input[0] >= 18;
    }
}
