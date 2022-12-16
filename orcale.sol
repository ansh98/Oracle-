pragma solidity >=0.4.25 <0.6.0;

contract OptionsContract {
    address payable owner;
    address payable player;
    uint public endTime;
    bool public started;
    bool public isAgainstBet;
    
    address payable public winner;
    
    constructor() public payable {
        owner = msg.sender;
    }

    function betOver10Degree() public payable {
        require(!started);
        started = true;
        player = msg.sender;
        endTime = now + 10 seconds;
        isAgainstBet = true;
    }
    
    function betUnder10Degree() public payable {
        require(!started);
        started = true;
        player = msg.sender;
        endTime = now + 10 seconds;
        isAgainstBet = false;
    }
    
    function determineWinner(uint _temp) public {
        require(now >= endTime);
        //here we need to find a way to retrieve the weather at endTime. How can we? We can't escape the sandbox...
        
        require(msg.sender ==  );
        if(_temp > 10) {
            if(isAgainstBet) {
                winner = player;
            } else {
                winner = owner;
            }
        } else {
            if(isAgainstBet) {
                winner = owner;
            } else {
                winner = player;
            }
        }
        
    }
    
    function withdraw() public {
        require(winner != address(0x0));
        winner.transfer(address(this).balance);
    }
    
    
}