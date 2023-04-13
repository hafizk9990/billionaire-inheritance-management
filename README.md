## Automating Inheritance Management Via Smart Contracts on Blockchain
Following is the detailed description of my first-ever smart contract implemented using very humble and basic knowledge of Solidity (contract-oriented language) on Ethereum (a gen-2 blockchain network)

### Why Do We Need a Smart Contract-Based Solution?
The need for a smart contract is self-evident in such a scenario, but a brief description is still provided down below for more clarity

Such a class of smart contracts come in handy when removal of any and all intermediary legal parties, i.e., lawyers and law firms is desirable while distributing one's inheritance. It is a known fact that human heart is home to evil and malintent because of which intermediary legal parties cannot be trusted. Smart contracts, I believe, will allow people to manage their inheritance in a much more reliable and confident manner even "after passing away." Our trust in blockchain's immutability and structural robustness gives us the confidence that our inheritance will be in the right hands, i.e., the source code written in a smart contract deployed on the blockchain network

### Scenario
It is the year 2035, and an Australian billionaire, Jason L. Clark, has been diagnosed with a serious illness cancer. He now has to distribute his rich inheritance justly.

After giving it a lot of thought, he converts all his liquid and non-liquid assets to crypto money, defines some rules, regulations and custom policies about his total fortune of US $6 billion and hires me to program his will into an Ethereum smart contract, so that his inheritance management can be automated through the blockchain network.

### Family Background & Lifestyle
The billionaire has 2 kids, viz. Jennifer and Ryan. They go to junior high and high school, respectively. Moreover, Jason has a wife, Anna, whom he loves very much. Besides this, Jason considers The Novo Nordisk Foundation, The Bill & Melinda Gates Foundation and The Wellcome Trust to be a part of his own family, as he regularly supports these organizations in their noble cause by making generous annual donations to them

### Project Use Cases
* We give the money off to kids when their life stage is updated by their mother on the smart contract. Every stage has a specific financial allowance pre-defined and hardcoaded in the contract. This allows kids to go through the current acadmic stage of their life without worrying about the financials. Moreover, the idea of getting rich financial allowance also incentivizes them to complete their academic journey and not drop out

* We have to do annual charity to all three foundations. Organizations cannot ask for more than one charity a year. If they do, we revert the transaction and do not offer them any money

* When a kid graduates, 12.5% of Jason's total wealth will be transferred to them. In this sense, both of the kids get 25% of Jason's wealth, collectively, but only after their graduation. When all the kids graduate, 25% of Jason's total assets should go to his wife. The remaining should be distributed equally among the three charity foundations. This forces Anna, Jason's wife, to send kids off to college and motivate them get through, because if she does not make kids go through college and get graduate, she does not get her part of inheritance at all

### Plot Loop Holes
Here, we are trusting Anna. If Anna is dishonest or if somebody forces her to be dishonest, the plan may fall apart but only partially, as she will only be able to wangle nearly 60% of the money; the remaining 40% can still be given off to charity

Another issue is that Anna may die. Here, if Anna dies, things fall apart differenty. The reason for this is that we need Anna's approval before offering money to the kids. So, if she is not there to vouche for the kids, we cannot proceed forward, and, eventually, over the course of decades, all the money will go to charity and the kids will get nothing

Several solutions to these problems are possible. We can register more family members in the smart contract and get everybody's approval of Anna's remarks and then proceed with transactions. Also, we can give somebody as much power as much Anna possesses, so, after her death, nothing stops

Bear in mind that such a system will be more complicated. Though it can be implemented with ease, but for the sake of demonstrating how legal intermediaries can be removed, current implementation of our contract is sufficient. It successfully shows how, over the course of decades, wealth can be distributed without any issues and troubles

### Oversimplifications
During implementation, some oversimplifications have also been introduced. For example, we have not used .transfer() or .send(), rather we managed everybody's balance locally in a mapping data strucuture along with introducing a few more simplifications

Please bear in mind that none of the simplifications make us deviate from making our actual point that no legal intermediaries are required for inheritance management, not even by the billionaires, in the blockchain era!

### Future Extension Plans
This smart contract may / may not be extended and connected in the future with a front-end client app, i.e., a decentralized web application. In case it is extended and connected, the code for the decentralized website will be pushed in another repository, and the link to the repository will be added down below. If there is no link down below, and this is the last statement in the readme file, it means the project has not been extended and taken up further
