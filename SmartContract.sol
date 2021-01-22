pragma solidity ^0.4.18;

import '/home/ubuntu/Project/CloudStorage/contracts/CloudStorage.sol';

contract SmartContract{
    //string data;
    uint data;
    uint temp;
    bytes32 hash;
    bytes32 hash1;
    address addressCloudStorage;
    uint provider;
    bool canDownload = false;

    event done(bytes32 hashing);
    
    function setData(uint _data) public{
        data = _data;
        setHash();          //Setting hash
        sendToCloud(data);  //Uploading to Cloud
	done(hash);
    }
    
    function getData() external view returns(uint){
        return data;
    }
    
    function setHash() internal{
	hash = sha256(data);
    }
    
    function getHash() external view returns(bytes32){
        return hash;
    }
    
    
    //Setting Address of ClousStorage
    function setAddressCloudStorage(address _addressCloudStrage) external{
        addressCloudStorage = _addressCloudStrage;
    }

    //Sending to cloud storage
    function sendToCloud(uint datasend) internal{
        CloudStorage cs = CloudStorage(addressCloudStorage);
        cs.uploadData(datasend);
    }

    function viewTemp() external view returns(uint){
	return temp;
    }
    
    function downloadData() external view returns(bool){
        CloudStorage cs = CloudStorage(addressCloudStorage);
	temp = cs.getData();
	hash1 = sha256(temp);
        if(hash == hash1){
		return true;
        }else{
		return false;
        }        
    }
    
}
