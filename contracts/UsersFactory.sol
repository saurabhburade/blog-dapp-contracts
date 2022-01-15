// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./UserContract.sol";

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

    function getChilds() public view returns (User[] memory) {
        return children;
    }
}
