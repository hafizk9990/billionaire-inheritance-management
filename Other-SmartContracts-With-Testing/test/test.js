let uzairContract = artifacts.require('./uzairContract.sol');
let uzairContractInstance; 

it("Testing contract deployment ... ", function() {
    return uzairContract.deployed().then(function (instance) {
      uzairContractInstance = instance;
      assert(uzairContractInstance !== undefined, 'Oops! Failed to deploy uzairContract');
    });
  });

it("Testing the getter function ... ", function () {
    return uzairContractInstance.getStateVariable.call().then(function (result) {
      assert.equal(0, result.toNumber(), 'Correct! Getter function returned the correct value');
    });
  });
