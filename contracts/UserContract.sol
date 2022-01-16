// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract User {
    string userName;
    address owner;
    address admin;
    string bio = "default";
    string profileImage;
    string coverImage;
    struct Blog {
        address _address;
        uint256 timestamp;
        uint256 createdBlock;
    }

    constructor(
        string memory _userName,
        string memory _profileImage,
        address _owner
    ) {
        userName = _userName;
        profileImage = _profileImage;
        owner = _owner;
    }

    // Function to add/update bio
    function updateBio(string memory _bio) public {
        bio = _bio;
    }

    // Function to add/update cover image

    function updateCoverImage(string memory _cover) public {
        coverImage = _cover;
    }

    // Function to update profile image

    function updateProfileImage(string memory _profileImg) public {
        profileImage = _profileImg;
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
