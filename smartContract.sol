pragma solidity ^0.8.4; 

// SPDX-License-Identifier: MIT 

contract InheritanceManagement {
    
    uint256 private totalWealth;
    uint256 private annaWealth;
    uint totalGraduatedKids; 
    
    enum LifeStages {
        juniorSchool, juniorHigh, highSchool, university, graduate
    }
    
    struct Kids {
        string name;
        LifeStages currentStage;
        bool isCollegeGraduate;
        uint bal; // balance
    }
    
    struct Orgs {
        string name;
        uint256 lastCharityWithdrawalTime;
        uint bal;
    }
    
    mapping (address => Kids) private kidsMap;
    mapping (address => Orgs) private orgsMap;
    mapping (address => uint) private isKidMap; // 1 implies address belongs to some family member. 0 implies address belongs to some organization
    mapping (string => address) nameToAddressMap;
    
    constructor(address mothersAddress, address kidOneAddress, address kidTwoAddress, address orgOneAddress, address orgTwoAddress, address orgThreeAddress) {
        
        totalWealth = 6000000000; // 6 billion dollars (total net worth) 
        totalGraduatedKids = 0;
        annaWealth = 0;
        
        
        // populating isKidMap data structure
        
        isKidMap[kidOneAddress] = 1;
        isKidMap[kidTwoAddress] = 1;
        isKidMap[orgOneAddress] = 0;
        isKidMap[orgTwoAddress] = 0;
        isKidMap[orgThreeAddress] = 0;
        
        
        // populating kidsMap data structure
        
        kidsMap[kidOneAddress].name = 'Jennifer';
        kidsMap[kidOneAddress].currentStage = LifeStages.juniorHigh; // elder kid goes to juniorHigh
        kidsMap[kidOneAddress].isCollegeGraduate = false;
        kidsMap[kidOneAddress].bal = 0;
        
        kidsMap[kidTwoAddress].name = 'Ryan';
        kidsMap[kidTwoAddress].currentStage = LifeStages.juniorSchool; // younger kid goes to juniorSchool
        kidsMap[kidTwoAddress].isCollegeGraduate = false;
        kidsMap[kidOneAddress].bal = 0;
        
        
        // populating orgsMap
        
        orgsMap[orgOneAddress].name = 'Novo-Nordisk-Foundation';
        orgsMap[orgOneAddress].lastCharityWithdrawalTime = 0;
        kidsMap[orgOneAddress].bal = 0;
        
        orgsMap[orgTwoAddress].name = 'The-Bill-And-Melinda-Gates-Foundation';
        orgsMap[orgTwoAddress].lastCharityWithdrawalTime = 0;
        kidsMap[orgTwoAddress].bal = 0;
        
        orgsMap[orgThreeAddress].name = 'The-Wellcome-Trust';
        orgsMap[orgThreeAddress].lastCharityWithdrawalTime = 0;
        kidsMap[orgThreeAddress].bal = 0;
        
        
        // inititializing nameToAddressMap
        
        nameToAddressMap['Anna'] = mothersAddress;
        nameToAddressMap['Jennifer'] = kidOneAddress;
        nameToAddressMap['Ryan'] = kidTwoAddress; 
        nameToAddressMap['Novo-Nordisk-Foundation'] = orgOneAddress;
        nameToAddressMap['The-Bill-And-Melinda-Gates-Foundation'] = orgTwoAddress;
        nameToAddressMap['The-Wellcome-Trust'] = orgThreeAddress;
    }
    
    /*
        isOrganization() ...
        
        Checks if this name is registered with us or not. 
        If not, no transaction occurs. Also checks if it is 
        registered with the same address or not. If not, no 
        charity occurs them. If they are registered and only 
        they are asking for money, then and then only they get 
        charity 
    */
    
    modifier isOrganization(address org, string memory name) {
        require(nameToAddressMap[name] == org);_;
    }
    
    /*
        isAnna() ...
        
        Here, we make sure that only Anna is trying to update 
        the stage of their kids academic life. If no, we don't 
        proceed forward
    */
    
    modifier isAnna(address incomingAddress) {
        require(nameToAddressMap['Anna'] == incomingAddress);_;
    }
    
    /*
        getCharity() ...
        
        An organization can get charity only once a year.
        A year, on this contract, is equal to 15 seconds.
        We strictly check if they have withdrawn charity this year or not.
        If not, then we give them charity. Charity amount is set by us.
        It is equal to $33, 000
    */
    
    function getCharity(string memory name) isOrganization(msg.sender, name) public {
        if (block.timestamp > orgsMap[msg.sender].lastCharityWithdrawalTime + 15 seconds) { // 1 year == 15 seconds 
            totalWealth -= 33000;
            orgsMap[msg.sender].bal += 33000;
            orgsMap[msg.sender].lastCharityWithdrawalTime = block.timestamp;
        }
        assert(totalWealth + 33000 >= 33000);
    }
    
    /*
        updateLifeCycleStage() ...
        
        Here, we enter if Anna updates academic stage of kids. 
        We transfer allowance to the kids based on what they need
        in this current stage of their life. 
        We make sure that we have enough money that we are transferring
    */
    
    function updateLifeCycleStage(string memory kidFirstName) isAnna(msg.sender) public {
        if (keccak256(bytes(kidFirstName)) == keccak256(bytes('Jennifer')) || keccak256(bytes(kidFirstName)) == keccak256(bytes('Ryan'))) {
            uint valueTransferred = 0;
            address kidsAddress = nameToAddressMap[kidFirstName];
            
            if (kidsMap[kidsAddress].currentStage == LifeStages.juniorSchool) {
                kidsMap[kidsAddress].currentStage = LifeStages.juniorHigh;
                
                totalWealth -= 25000;
                kidsMap[kidsAddress].bal += 25000;
                valueTransferred = 25000;
            }
            else if (kidsMap[kidsAddress].currentStage == LifeStages.juniorHigh) {
                kidsMap[kidsAddress].currentStage = LifeStages.highSchool;
                
                totalWealth -= 25000;
                kidsMap[kidsAddress].bal += 25000;
                valueTransferred = 25000;
            }
            else if (kidsMap[kidsAddress].currentStage == LifeStages.highSchool) {
                kidsMap[kidsAddress].currentStage = LifeStages.university;
                
                totalWealth -= 500000;
                kidsMap[kidsAddress].bal += 500000;
                valueTransferred = 500000;
            }
            else if (kidsMap[kidsAddress].currentStage == LifeStages.university) {
                kidsMap[kidsAddress].currentStage = LifeStages.graduate;
                kidsMap[kidsAddress].isCollegeGraduate = true;
                totalGraduatedKids++;
                
                totalWealth -= 750000000; // this kid's inheritance (12.5% of the original $6 billion)
                kidsMap[kidsAddress].bal += 750000000;
                valueTransferred = 750000000;
                
                if (totalGraduatedKids == 2) {
                    endEverything();
                }
            }
            
            assert(totalWealth + valueTransferred >= valueTransferred);
        }
        else {
            revert();
        }
    }
    
    /*
        endEverything() ... 
        
        This function is called only when Anna successfully gets both the kids through college. 
        Now, Anna gets 25% of our total wealth, i.e., $1.5 billion. 
        The reamaining goes to charity foundations
    */
    
    function endEverything() private {
        totalWealth -= 1500000000;
        annaWealth += 1500000000;
        
        assert(totalWealth + 1500000000 >= 1500000000);
        
        uint threeParts = (totalWealth / 3) - 1;
        orgsMap[nameToAddressMap['Novo-Nordisk-Foundation']].bal += threeParts;
        orgsMap[nameToAddressMap['The-Bill-And-Melinda-Gates-Foundation']].bal += threeParts;
        orgsMap[nameToAddressMap['The-Wellcome-Trust']].bal += threeParts;
        
        totalWealth -= ((3 * threeParts) + 1);
    }
}

