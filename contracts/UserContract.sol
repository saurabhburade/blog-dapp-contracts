// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract User {
    string userName;
    address owner;
    address admin;
    string bio = "default";
    string profileImage = "default";
    string coverImage = "default";
    uint256 idx;
    struct Blog {
        address _address;
        uint256 timestamp;
        uint256 createdBlock;
    }
    Blog[] myBlogs;

    constructor(
        string memory _userName,
        string memory _profileImage,
        address _owner,
        uint256 _idx
    ) {
        userName = _userName;
        profileImage = _profileImage;
        owner = _owner;
        idx=_idx;
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
            string memory _userName,
            string memory _bio,
            string memory _profileImage,
            address _owner,
            uint256 _idx,
            Blog[] memory _myBlogs
        )
    {
        return (userName, bio, profileImage, owner,idx, myBlogs);
    }

    event BlogCreated(address blogAddress, string _blogIPFShash);

    function createBlog(string memory blogIPFShash) public {
        address _owner = msg.sender;
        BlogContract child = new BlogContract(_owner, blogIPFShash);
        Blog memory newBlog = Blog(
            address(child),
            block.timestamp,
            block.number
        );
        emit BlogCreated(address(child), blogIPFShash);

        myBlogs.push(newBlog);
    }
}

contract BlogContract {
    uint256 createdblock;
    uint256 timestamp;
    address owner;
    string blogIPFShash;

    constructor(address _owner, string memory _blogIPFShash) {
        createdblock = block.number;
        owner = _owner;
        blogIPFShash = _blogIPFShash;
        timestamp = block.timestamp;
    }

    function getFields()
        public
        view
        returns (
            uint256 _createdblock,
            uint256 _timestamp,
            address _owner,
            string memory _blogIPFShash
        )
    {
        return (createdblock, timestamp, owner, blogIPFShash);
    }
}
