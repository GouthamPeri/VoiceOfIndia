pragma solidity ^0.4.11;

contract DetailedPost {
	
        struct Post {
          uint id;
   	  address owner;
   	  string title;
   	  string message;
  	  uint upvotes;
   	  uint downvotes;
 	}

	mapping (address => string) _addressToAccountName;
	mapping (uint => Post) posts;

	uint _numberOfAccounts;
        uint _numberOfPosts;
	address _registryAdmin;
	

	function TweetRegistry() {
		_registryAdmin = msg.sender;
		_numberOfAccounts = 0;
                _numberOfPosts = 0;
	}

	function register(string name, address accountAddress) returns (int result) {
		_addressToAccountName[accountAddress] = name;
		_numberOfAccounts++;
		result = 0; // success
	}

        function upvote(uint postId) constant returns (uint result){
		posts[postId].upvotes +=1;
                return posts[postId].upvotes; 
        }

	function downvote(uint postId) constant returns (uint result){
		posts[postId].downvotes +=1;
		return posts[postId].downvotes; 
        }

	function createPost(string _title, string _message){
                _numberOfPosts += 1;
		Post memory newPost = Post({id: _numberOfPosts, owner: msg.sender, title: _title, message: _message, upvotes: 0, downvotes: 0});
		posts[_numberOfPosts] = newPost;
        }

}
