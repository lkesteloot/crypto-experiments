
const Faucet = artifacts.require("Faucet");

function ether(n) {
    return new web3.utils.BN(
        web3.utils.toWei(n.toString(), 'ether')
    );
}

module.exports = async function (callback) {
    try {
        // to get an instance of the abstraction for the contract.
        const faucet = await Faucet.deployed();   
        console.log(faucet.withdraw);

        // to get list of accounts in Ganache.
        const accounts = await web3.eth.getAccounts()  
        console.log(accounts.length);

        // To withdraw from the faucet into the second account, which should now have 100.10 ETH.
        await faucet.withdraw("100000000000000000", {from: accounts[1]});   
    } catch (e) {
        console.log(e);
    }

    callback();
};

