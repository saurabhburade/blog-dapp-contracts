// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract User {
    string userName;
    address owner;
    address admin;
    string bio = "default";
    string profileImage;

    constructor(
        string memory _userName,
        string memory _profileImage,
        address _owner
    ) {
        userName = _userName;
        profileImage = _profileImage;
        owner = _owner;
    }

    function getFields()
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            address
        )
    {
        return (userName, bio, profileImage, owner);
    }
}
