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
    struct UserSruct {
        address owner;
        address userProfile;
    }

    UserSruct[] children;
    mapping(address => UserSruct) childMap;

    function createUser(string memory _userName, string memory _profileImage)
        public
    {
        address _owner = msg.sender;
        uint256 _id = children.length;
        User child = new User(_userName, _profileImage, _owner, _id);
        UserSruct memory newUserDetails = UserSruct(_owner, address(child));
        childMap[_owner] = newUserDetails;
        children.push(newUserDetails);
        emit ChildCreated(address(child), _userName, _profileImage);
    }

    function getChilds() public view returns (UserSruct[] memory) {
        return children;
    }

    function getUserByAddress(address _address)
        public
        view
        returns (UserSruct memory _userDetails)
    {
        return childMap[_address];
    }
}
