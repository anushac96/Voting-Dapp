# Voting-Dapp

The project is built using the Ethereum blockchain and Solidity smart contracts, and provides a simple interface for users to register as voters or candidates, view the list of registered candidates, and vote for their preferred candidates.

The repository contains the code for both the smart contract and the frontend application, and can be used as a reference or a starting point for developing similar decentralized applications. To run the application, the user needs to have npm, truffle, and Metamask installed on their system.

We have improved and added few features which are mentioned below in the list of features
ADDED FEATURES - MADE IMPROVEMENT

# Features includes 
1. Register Candidate
2. Register Voter
3. View Voter status
4. Delegate the vote to other voter with respect to the address
5. Start the voting/election process
6. Stop the voting/election process
7. Name the election
8. Total numbers of votes for each of the candidates
9. Vote to candidate
10. Display the winner of the election
11. Display Candidate details
12. Get voter status
13. Eye catchy User Interface

# Team Members
1. Anusha Hadagali CWID: 885451450 Email ID: anusha.hadagali@csu.fullerton.edu
3. Surrajkumar Prabhu Venkatesh CWID: 885198499 Email ID: surrajkumar2000@csu.fullerton.edu
4. Prashams Omprakash Daulath CWID: 885582262 Email ID: prash_IND@csu.fullerton.edu
5. Manish Reddy Kambalapally CWID: 885175679 Email ID: manish.reddy@csu.fullerton.edu

## Pre-requestis
1. Npm and node should be installed
2. Truffle 
3. Metamask extension in the browser

## Quick Start
### To run in Truffle
#### Steps to compile the contract(terminal 1)
1. Clone the repo
2. cd Voting-dapp/contract-folder
3. Install dependencies: `npm install`
4. Run truffle in a terminal: `truffle develop`
5. Compile the code: `compile`
6. Migrate the code: `migrate --reset`
#### Steps to run the forntend application(terminal 2)
1. Copy and paste the Voting.json file generated in contract-folder/build after migrating the contract in the web_app/src directory.
2. Install dependencies: `npm install`
3. Make sure truffle is running in terminal 1. If not then run truffle with the command: `truffle develop --seed="test"`
4. Open metamask and create accounts for voters and candidates by using accounts provided by truffle
5. Run the react app: `npm start`

### To run in Ganach
#### Steps to compile the contract(terminal 1)
1. Clone the repo
2. cd Voting-dapp/contract-folder
3. Install dependencies: `npm install`
5. Compile the code: `truffle compile`
6. Migrate the code: `truffle migrate --reset`
#### Steps to run the forntend application(terminal 2)
1. Copy and paste the Voting.json file generated in contract-folder/build after migrating the contract in the web_app/src directory.
2. Install dependencies: `npm install`
4. Open metamask and create accounts for voters and candidates by using accounts provided by Ganach
5. Run the react app: `npm start`


#Repo of our project 
https://github.com/anushac96/Voting-Dapp
