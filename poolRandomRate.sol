// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract RandomRateSuite is Ownable {
    using Strings for string;
    uint16 private constant NFT_TYPE = 0; //Kingdom
    uint16 private constant KINGDOM = 1; //Kingdom
    uint16 private constant TRANING_CAMP = 2; //Training Camp
    uint16 private constant GEAR = 3; //Battle Gear
    uint16 private constant DRO = 4; //Battle DRO
    uint16 private constant SUITE = 5; //Battle Suit
    uint16 private constant BOT = 6; //Battle Bot
    uint16 private constant GEN = 7; //Human GEN
    uint16 private constant WEAP = 8; //WEAP
    uint16 private constant COMBAT_RANKS = 9; //Combat Ranks
    uint16 private constant BLUEPRINT_COMM = 0;
    uint16 private constant BLUEPRINT_RARE = 1;
    uint16 private constant BLUEPRINT_EPIC = 2;
    uint16 private constant BLUEPRINT_LIMITED = 7;
    uint16 private constant GENOMIC_COMMON = 3;
    uint16 private constant GENOMIC_RARE = 4;
    uint16 private constant GENOMIC_EPIC = 5;
    uint16 private constant GENOMIC_LIMITED = 8;
    uint16 private constant SPACE_WARRIOR = 6;
    uint16 private constant COMMON_BOX = 0;
    uint16 private constant RARE_BOX = 1;
    uint16 private constant EPIC_BOX = 2;
    uint16 private constant SPECIAL_BOX = 3;
    uint16 private constant COMMON = 0;
    uint16 private constant RARE = 1;
    uint16 private constant EPIC = 2;

    //EPool
    mapping(uint16 => uint16) public EPool;

    mapping(uint16 => uint256[]) BPPoolPercent;
    mapping(uint16 => uint16[]) BPPoolResults;
    mapping(uint16 => uint16[]) BPPoolValues;

    function initial() public onlyOwner {

        EPool[2] = SUITE; //Battle Suit
        EPool[4] = WEAP; //WEAP

        //-----------------START RATE --------------------------------


        BPPoolPercent[SUITE] = [
            uint256(2666),
            uint256(2666),
            uint256(2666),
            uint256(125),
            uint256(125),
            uint256(125),
            uint256(125),
            uint256(250),
            uint256(250),
            uint256(250),
            uint256(250),
            uint256(250),
            uint256(250)
        ];

        BPPoolResults[SUITE] = [3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17];

        for (
            uint16 p = 0;
            p < BPPoolPercent[SUITE].length;
            p++
        ) {
            uint256 qtyItem = (100 * BPPoolPercent[SUITE][p]) /
                10000;
            for (uint16 i = 0; i < qtyItem; i++) {
                BPPoolValues[SUITE].push(
                    BPPoolResults[SUITE][p]
                );
            }
        }

        //-----------------END COMMON BOX RATE --------------------------------
    }

    function getEquipmentPool(uint16 _number) public view returns (uint16) {
        return EPool[_number];
    }

    function getBlueprintPool(
        uint16 _number
    ) public view returns (uint16) {
        uint16 _modNumber = uint16(_number) %
            uint16(BPPoolValues[SUITE].length);
        return uint16(BPPoolValues[SUITE][_modNumber]);
    }
}
