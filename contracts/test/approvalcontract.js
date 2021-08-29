const ApprovalContract = artifacts.require('../../contracts/ApprovalContract.sol');

contract('ApprovalContract', function(accounts){
    it('initialize contract', async function() {
        const contract = await ApprovalContract.deployed();
        const approver = await contract.approver.call();

        assert.equal(approver, 0xe707e6621d64FDE2606174e72a98d8236393C209, "approvers don't match");
    });

    it('takes a deposit', async function() {
        const contract = await ApprovalContract.deployed();
        await  contract.deposit(accounts[0], {
            value: 1e+18,
            form: accounts[1]
        });

        assert.equal(await web3.eth.getBalance(contract.address), 1e+18, "Amount did not match");
    });
})