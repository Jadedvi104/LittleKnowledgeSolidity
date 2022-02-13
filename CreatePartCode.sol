//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "hardhat/console.sol";

contract StringTest is Ownable {
    using Strings for string;
    

    function createBlueprintPartCode()
        public
        pure
        returns (string memory)
    {
        string memory partCode;

        //battleSuiteCode
        partCode = createPartCode(
            5, //equipmentTypeId
            0, //combatRanksCode
            0, //WEAPCode
            0, //humanGENCode
            0, //battleBotCode
            14, //battleSuiteCode
            0, //battleDROCode
            0, //battleGearCode
            0, //trainingCode
            0, //kingdomCode
            1
        );

        return partCode;
    }

    function createPartCode(
        uint16 equipmentCode,
        uint16 starCode,
        uint16 weapCode,
        uint16 humanGENCode,
        uint16 battleBotCode,
        uint16 battleSuiteCode,
        uint16 battleDROCode,
        uint16 battleGearCode,
        uint16 trainingCode,
        uint16 kingdomCode,
        uint16 nftTypeCode
    ) internal pure returns (string memory) {
        string memory code = convertCodeToStr(nftTypeCode);
        code = concateCode(code, kingdomCode);
        code = concateCode(code, trainingCode);
        code = concateCode(code, battleGearCode);
        code = concateCode(code, battleDROCode);
        code = concateCode(code, battleSuiteCode);
        code = concateCode(code, battleBotCode);
        code = concateCode(code, humanGENCode);
        code = concateCode(code, weapCode);
        code = concateCode(code, starCode);
        code = concateCode(code, equipmentCode); //Reserved
        code = concateCode(code, 0); //Reserved
        code = concateCode(code, 0); //Reserved
        return code;
    }

    function concateCode(string memory concatedCode, uint256 digit)
        internal
        pure
        returns (string memory)
    {
        concatedCode = string(
            abi.encodePacked(convertCodeToStr(digit), concatedCode)
        );

        return concatedCode;
    }

    function convertCodeToStr(uint256 code)
        private
        pure
        returns (string memory)
    {
        if (code <= 9) {
            return string(abi.encodePacked("0", Strings.toString(code)));
        }

        return Strings.toString(code);
    }
    
    
}


