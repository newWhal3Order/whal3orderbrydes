pragma solidity >=0.5.0 <0.6.0;

contract Brydes {

    event NewBryde(uint brydeId, string name, uint dna);

    uint brydeDigits = 16;
    uint brydeModulus = 10 ** dnaDigits;

    struct Bryde {
        string name;
        uint dna;
    }

    Bryde[] public brydes;

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
