// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UsersFactory {
    address public owner;
    event ChildCreated(
        address childAddress,
        string _userName,
        string _profileImage
    );

    User[] children;

    function createUser(string memory _userName, string memory _profileImage)
        public
    {
        address _owner = msg.sender;
        User child = new User(_userName, _profileImage, _owner);
        children.push(child);
        emit ChildCreated(address(child), _userName, _profileImage);
    }
}

contract User {
    string userName;
    address owner;
    address admin;
    string bio;
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

    function getFields () public pure returns (
            string memory _userName,
            string memory _bio,
            string memory _profileImage,
            address _owner
        )
    {
        return (_userName, _bio, _profileImage, _owner);
    }
}
