contract BlogsFactory {
    Blog[] children;

    function createBlog(string memory blogIPFShash) public {
        address _owner = msg.sender;
        Blog child = new Blog(_owner, blogIPFShash);
        children.push(child);
    }
}

contract Blog {
    uint256 createdblock;
    uint256 timestamp;
    address owner;
    string blogIPFShash;

    constructor(address _owner, string memory _blogIPFShash) {
        createdblock = block.number;
        owner = _owner;
        blogIPFShash = _blogIPFShash;
    }
}
