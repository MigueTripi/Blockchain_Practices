pragma solidity ^0.5.16;
//pragma solidity ^0.4.18;

contract ApprovalContract{
    
    address public sender;
    address public receiver;
    address public approver = 0xe707e6621d64FDE2606174e72a98d8236393C209;

    function deposit(address _receiver) external payable {
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;

    }

    function viewApprover() external view returns(address){
        return(approver);
    }

    function approve() external{
        require(msg.sender == approver);
        address payable aReceiver = address(uint160(receiver));
        aReceiver.transfer(address(this).balance);

        // address payable aReceiver = address(uint160(receiver));
        // address payable(address(uint160(receiver))).transfer(address(this).balance);
    }
}