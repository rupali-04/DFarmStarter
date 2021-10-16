// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract FarmerCropFactory{
    address[] public deployedCampaign;
    
    Campaign newCampaign ;
    
    function createCampaign(string memory desc, uint minAmt, uint cropAmt) public {
        newCampaign = new Campaign(desc,minAmt,cropAmt,msg.sender);
        deployedCampaign.push(address(newCampaign));
    }
    function getDeployedContracts() public view returns(address[] memory){
        return deployedCampaign;
    }
    
}

contract Campaign{
    
    struct Request {
        string description;
        uint value;
        address recipient;
        bool complete;
        uint approvalCount;
    }
    mapping(address =>mapping(uint => bool)) approvals;
    
    Request[] public requests;
    address public farmer;
    uint public minAmount;
    string public desc;
    address private approvers;
    uint approverscount = 0;
    bool completeCampaign = false;
    bool deliveryStatus = false;
    uint crop_Production;
    address logisticsSupplier;
    uint costLogistics;
    
    modifier onlyFarmer {
        require(msg.sender == farmer);
        _;
    }
    
    modifier onlyApprover {
        require(msg.sender == approvers);
        _;
    }
    
    constructor(string memory _desc,uint _value, uint _amt,address creator){
        farmer = creator;
        minAmount = _value;
        crop_Production = _amt;
        desc = _desc;
    }
    
    function contribute() public payable {
        require(msg.value >= minAmount);
        require(approverscount == 0);
        approverscount++;
        approvers = msg.sender;
    }
    
    function createRequest(string memory description,uint value,address recipient) public onlyFarmer {
        
        Request memory newRequest = Request({
            description: description,
            value: value,
            recipient: recipient,
            complete: false,
            approvalCount: 0
        });
        requests.push(newRequest);
        
    }
    
    function approvalRequest(uint index) public {
        require(approvers == msg.sender);
        require(approvals[msg.sender][index] == false,"Sorry can't approve for secound time");
         approvals[msg.sender][index] = true;
        requests[index].approvalCount++;
    }
    
    // Finalize the request
    function finalizeRequest(uint index) onlyFarmer public {
        require(requests[index].complete == false);
        require(requests[index].approvalCount == approverscount);
       // minAmount = minAmount - requests[index].value;
        requests[index].complete = true;
        address payable to = payable(requests[index].recipient);
        to.transfer(requests[index].value);
    }
    function logistics(address _logisticsSupplier,uint _costLogistics) public onlyApprover{
        require(completeCampaign == false);
        completeCampaign = true;
        logisticsSupplier = _logisticsSupplier;
        costLogistics = _costLogistics;
        //logisticsOTP = getOTP();
    } 
    function finalizeCampaign() onlyFarmer public {
         
        require(deliveryStatus == true);
        address payable to = payable(farmer);
        to.transfer((address(this).balance - costLogistics));
    }
   
   
    modifier onlyLogistics {
        require(msg.sender == logisticsSupplier);
        _;
    }
    function delivery() onlyLogistics public {
        require(completeCampaign == true);
        deliveryStatus = true;
    }
    function reciver() onlyApprover public{
        require(completeCampaign == true);
        address payable to = payable(logisticsSupplier);
        to.transfer(address(this).balance);
    }
}