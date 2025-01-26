# Self-Sovereign Identity with Blockchain and Zero-Knowledge Proofs

This project explores the use of **Blockchain** and **Zero-Knowledge Proofs (ZKPs)** in the context of **Self-Sovereign Identity (SSI)** to enhance the university registration process. The goal is to create a **privacy-preserving, secure, and user-friendly** registration system using **Ethereum blockchain** and **ZKP-based verification**.

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Future Improvements](#future-improvements)
- [License](#license)

## Overview
The current university registration process relies heavily on centralized systems such as Hochschulstart, which can be slow and expose personal data to third parties. This project aims to demonstrate how **decentralized identity management** using **blockchain** and **ZKPs** can provide a more efficient and private solution.

### Key Features
- **Blockchain-Based SSI:** Students can register and verify their identity without relying on centralized authorities.
- **Zero-Knowledge Proofs:** Identity attributes (such as age) can be verified without revealing sensitive data.
- **Ethereum Smart Contracts:** Verifiable credentials are issued and verified on a private Ethereum blockchain.
- **Improved Privacy and Security:** Only essential information is shared during the verification process.

## Technologies Used
- **Blockchain:** Ethereum (Hardhat framework)
- **Zero-Knowledge Proofs (ZKP):** circom, snarkJS
- **Smart Contracts:** Solidity
- **Frontend:** React (to be added)
- **Development Tools:** Node.js, Hardhat, Ganache

## Project Structure
```
ssi-blockchain-zkp-demo/
├── circom/                     # ZKP circuit definitions and proofs
├── frontend/                   # React frontend (to be added)
├── smart-contracts/             # Ethereum smart contracts and deployment scripts
│   ├── contracts/               # Solidity contracts
│   ├── scripts/                 # Deployment scripts
│   ├── test/                     # Contract tests
│   └── hardhat.config.js         # Hardhat configuration
├── README.md                    # Project documentation
└── package.json                  # Node.js dependencies
```

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/ssi-blockchain-zkp-demo.git
   cd ssi-blockchain-zkp-demo
   ```

2. **Install dependencies:**
   ```bash
   cd smart-contracts
   npm install
   cd ../circom
   npm install
   ```

3. **Compile the ZKP circuits:**
   ```bash
   circom proof.circom --r1cs --wasm --sym -o build/
   ```

4. **Run a local Ethereum blockchain using Hardhat:**
   ```bash
   cd smart-contracts
   npx hardhat node
   ```

5. **Deploy the smart contract:**
   ```bash
   npx hardhat run --network localhost scripts/deploy.js
   ```

## Usage

1. **Generate a witness for verification:**
   ```bash
   node build/proof_js/generate_witness.js build/proof_js/proof.wasm input.json witness.wtns
   ```

2. **Setup and generate proof:**
   ```bash
   snarkjs groth16 prove build/circuit_0001.zkey witness.wtns build/proof.json build/public.json
   ```

3. **Verify the proof:**
   ```bash
   snarkjs groth16 verify build/verification_key.json build/public.json build/proof.json
   ```

4. **Interact with the contract:**
   Open Hardhat console and interact with the deployed contract:
   ```bash
   npx hardhat console --network localhost
   const contract = await ethers.getContractAt("IdentityVerification", "DEPLOYED_CONTRACT_ADDRESS");
   await contract.verifyProof(a, b, c, input);
   ```

## Testing
To ensure the functionality and performance of the system, tests will be conducted on the following aspects:
- **Performance:** Evaluate the credential issuance and verification times.
- **Security:** Ensure data privacy and contract security.
- **Usability:** Assess the user experience for students and university administrators.

Run smart contract tests with:
```bash
npx hardhat test
```

## Future Improvements
- Implementing a frontend using React for user interaction.
- Integration with existing university systems via APIs.
- Enhancing ZKP circuit efficiency for faster verification.

## License
This project is licensed under the MIT License.

---
