pragma solidity ^0.4.18;

import '/home/ubuntu/Project/SmartContract/contracts/SmartContract.sol';

contract UserCommunity{
    //string downloadedData;
    uint downloadedData;
    address addressSmartContract;
    address addressCloudStorage;
    
    function setAddressSmartContract(address _addressSmartContract) external{
        addressSmartContract = _addressSmartContract;
    }
    
    function setAddressCloudStoragr(address _addressCloudStorage) external{
        addressCloudStorage = _addressCloudStorage;
    }

    function downloadData() external view returns(uint){
        SmartContract sc = SmartContract(addressSmartContract);
	CloudStorage cs = CloudStorage(addressCloudStorage);
        if(sc.downloadData()){
            downloadedData = cs.getData();
        } else{
            downloadedData = 0;
        }
        return downloadedData;
    }
    
    function viewData() external view returns(uint){
        return downloadedData;
    }
}
