# Polygon zkEVM

This project implements a logic circuit using Circom, generating the necessary intermediaries, proof, and deploying a Solidity verifier on the Amoy testnet.

## Description

The Logic Circuit project demonstrates how to create a basic logic circuit in Circom, compile it, generate a proof using specific inputs, and deploy a Solidity verifier.

## Getting Started

### Prerequisites

- Node.js (v12 or higher)
- Circom
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

Create a file named `circuit.circom` .
```

### Implementing the Circuit

Create a file named `circuit.circom` with the following logic:

```circom
pragma circom 2.0.0;

template LogicCircuit() {
    signal input A;
    signal input B;
    signal output C;

    C <== A + B; // Example logic operation
}

component main = LogicCircuit();
```

### Compiling the Circuit

To compile the circuit and generate intermediaries along with the verifier, run:

```bash
npx hardhat circom circuit.circom
```

This command will generate the necessary verifier contract file.

### Deploying the Solidity Verifier

To deploy the Solidity verifier on the Amoy testnet, use the following command:

```bash
npx hardhat run scripts/deploy.ts --network amoy
```

### Author
Amir Raza
