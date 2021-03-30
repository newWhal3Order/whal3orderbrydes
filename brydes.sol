pragma solidity >=0.5.0 <0.6.0;

contract Brydes {

    event NewBryde(uint brydeId, string name, uint dna);

    uint brydeDigits = 16;
    uint brydeModulus = 10 ** dnaDigits;

    // create a new struct type
    // takes in a name and a dna 
    struct Bryde {
        string name;
        uint dna;
    }
    
    // create a new extensible struct of type Bryde named brydes 
    Bryde[] public brydes;

    // create a bryde 
    // takes in a name and a dna
    // push 
    function _createBryde(string memory _name, uint _dna) private {
        brydes.push(Bryde(_name, _dna));
        uint id = brydes.push(Bryde(_name, _dna)) - 1;
        emit NewBryde(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % brydeModulus;
    }

    function createRandomBryde(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createBryde(_name, randDna);
    }

}
