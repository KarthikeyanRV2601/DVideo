pragma solidity ^0.5.0;

//[x] model the video
//[x] upload the video
//[ ] store the video
//[ ] list videos


contract DVideo {
  uint public videoCount = 0;
  string public name = "DVideo";
  
  mapping(uint =>Video) public videos;
  //Create Struct

  struct Video{
    uint id;
    string hash;
    string title;
    address author; //since it is an etherium blockchain,it will be address of the uploader
  }
  //Create Event
  event VideoUploaded(
    uint id,
    string hash,
    string title,
    address author
  );
  constructor() public {

  }

  function uploadVideo(string memory _videoHash, string memory _title) public {
    // Make sure the video hash exists
    // Make sure video title exists
    // Make sure uploader address exists
    require(bytes(_videoHash).length>0&&bytes(_title).length>0&&msg.sender!=address(0));
   

    // Increment video id
    videoCount++;
     // Add video to the contract
    videos[videoCount]=Video(videoCount,_videoHash,_title,msg.sender);
    emit VideoUploaded(videoCount,_videoHash,_title,msg.sender);
    // Trigger an event
  }
}
