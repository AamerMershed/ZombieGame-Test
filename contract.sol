//pragma solidity >=0.5.0 <0.6.0;

contract ZombieFactory {

    // declare our event here
     uint dnaDigits = 16;

   
    uint dnaModulus = 104 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;
    
    mapping (uint => address) public zombieToOwner;
    mapping (address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) internal {
        zombies.push(Zombie(_name, _dna));
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        require(ownerZombieCount [msg.sender] ==0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}

contract ZombieFeeding is ZombieFactory {
    
}
