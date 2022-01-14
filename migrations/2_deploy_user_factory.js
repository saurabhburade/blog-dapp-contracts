const UsersFactory = artifacts.require("UsersFactory");

module.exports = function (deployer) {
  deployer.deploy(UsersFactory);
};
