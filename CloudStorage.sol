pragma solidity ^0.4.18;

contract CloudStorage{
    //string data;
    uint data;
    
    function uploadData(uint _data) external{
        data = _data;
    }
    
    function downloadData() external view returns(uint){
        return data;
    }
    
    function getData() external view returns(uint){
        return data;
    }
}
