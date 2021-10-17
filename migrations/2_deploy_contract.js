const FarmerCropFactory = artifacts.require("FarmerCropFactory");

module.exports = function (deployer) {
  deployer.deploy(FarmerCropFactory);
};
