
const GlitterCoin = artifacts.require("GlitterCoin");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(GlitterCoin, { from: accounts[0] });
};
