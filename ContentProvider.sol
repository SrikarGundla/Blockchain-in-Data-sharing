pragma solidity ^0.4.18;

import '/home/ubuntu/Project/SmartContract/contracts/SmartContract.sol';
import '/home/ubuntu/Project/CloudStorage/contracts/CloudStorage.sol';

contract ContentProvider{
    //string content;
    uint content;
    address addressSmartContract;
    address addressCloudStorage;
    
    function setAddressSmartContract(address _addressSmartContract) external{
        addressSmartContract = _addressSmartContract;
    }
    
    function setContent(uint con) external{
        SmartContract sc = SmartContract(addressSmartContract);
        content = con;
        sc.setData(con);
    }
    
    function getContent() external view returns(uint){
        return content;
    }
    
    function setAddressCloudStorage(address _addressCloudStorage) external{
        addressCloudStorage = _addressCloudStorage;
    }
    
    /*function viewContent() external view returns(string){
        CloudStorage cs = CloudStorage(addressCloudStorage);
        return cs.getData();
    }*/
}

