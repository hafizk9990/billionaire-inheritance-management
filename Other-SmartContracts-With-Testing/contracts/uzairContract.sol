pragma solidity >=0.4.2;

contract uzairContract {
	uint public stateVariable;	
	
	constructor() public {
		stateVariable = 0;	
	}

	function getStateVariable() view public returns(uint) {
		return stateVariable;
	}
	
	function setStateVariable(uint incomingValue) public {
		stateVariable = incomingValue;
	}
}
