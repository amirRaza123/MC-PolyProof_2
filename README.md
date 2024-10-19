# Polygon zkEVM

This project implements a logic circuit using Circom, generating the necessary intermediaries, proof, and deploying a Solidity verifier on the Amoy testnet.

## Description

The Logic Circuit project demonstrates how to create a basic logic circuit in Circom, compile it, generate a proof using specific inputs, and deploy a Solidity verifier.

## Getting Started

### Prerequisites

- Node.js (v12 or higher)
- Circom
- SnarkJS
- An Ethereum wallet (like MetaMask) for deploying to the Amoy testnet

### Installation

1. Clone the repository into gitpos:
   ```bash
   git clone https://github.com/gmchad/zardkat.git
   
   ```

2. Install dependencies:
   ```bash
   npm i
   ```

### Implementing the Circuit

Create a file named `circuit.circom` .
```

### Compiling the Circuit

To compile the circuit and generate intermediaries, run the following command:

```bash
npx circom circuit.circom --r1cs --wasm --sym
```

This will generate the `.r1cs` file and the `.wasm` file for further processing.

### Generating a Proof

To generate a proof using inputs A=0 and B=1, execute the following commands:

1. Create an input JSON file, `input.json`:

```json
{
  "A": 0,
  "B": 1
}
```

2. Run the proof generation:

```bash
npx snarkjs setup
npx snarkjs compute-witness -i input.json
npx snarkjs generate-proof
```

### Deploying the Solidity Verifier

To deploy a Solidity verifier on the Amoy testnet:

1. Compile the verifier contract:
   ```bash
   npx snarkjs groth16 export verifier
   ```

2. Deploy the compiled verifier contract using Hardhat or Truffle. For example, with Hardhat:

```bash
npx hardhat run scripts/deployVerifier.js --network amoy
```

### Verifying the Proof

After deploying the verifier contract, call the `verifyProof()` method. Here's an example of how to do it in JavaScript:

```javascript
const { ethers } = require("hardhat");

async function main() {
    const verifierAddress = "DEPLOYED_VERIFIER_ADDRESS";
    const verifierContract = await ethers.getContractAt("Verifier", verifierAddress);

    const proof = /* your proof data */;
    const inputs = [0, 1]; // The public inputs

    const isValid = await verifierContract.verifyProof(proof, inputs);
    console.assert(isValid === true, "Proof verification failed!");
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});
```

### Authors

Metacrafter Chris  
[@metacraftersio](https://twitter.com/metacraftersio)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
