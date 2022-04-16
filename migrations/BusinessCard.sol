//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

/// @title Contract to create NFT-Business Card
/// @author Yuseok Michael Won
contract BusinessCard{

    event NewBusinessCard(uint cardId, string frontUrl, string backUrl);
    
    struct BusinessCard{
        string frontUrl;
        string backUrl;
        string name;
        string role;
        string email;
        string officeAddress;
        uint32 phone;
    }

    BusinessCard[] public businessCards;
    

    //mapping (uint => address) public cardToCreator;
    
    /// @notice Save owner address of a business card
    mapping (uint => address) public cardToOwner;

    /// @notice Check number of business card a user have
    mapping (address => uint) ownerCardCount;

    /// @notice Create business card & send event
    /// @dev All param values come from Front-side of app
    function _createCard(
        string memory _frontUrl,
        string memory _backUrl,
        string memory _name,
        string memory _role,
        string memory _email,
        string memory _officeAddress,
        uint32 _phone
    ) private {
        businessCards.push(BusinessCard(_frontUrl, _backUrl, _name, _role, _email, _officeAddress, _phone));
        uint id = businessCards.length - 1;
        cardToOwner[id] = msg.sender;
        ownerCardCount[msg.sender] =  ownerCardCount[msg.sender] + 1;
        emit NewBusinessCard(id, _frontUrl, _backUrl);
    }
}