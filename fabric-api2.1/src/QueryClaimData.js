'use strict';
const { Gateway, Wallets, TxEventHandler, GatewayOptions, DefaultEventHandlerStrategies, TxEventHandlerFactory } = require('fabric-network');
const { Contract } = require('fabric-contract-api');
const helper = require('./helpper');

const getClaimDataByClaimId = async function(claimId)
{
    var channelName = 'claimchannel';
    var org_name='nationwide';
    var username='admin';
    var chaincodeName='smartclaim';
    var fnc ='getresponse';
    console.log('============ invoke transaction on channel %s ============');
    
    const ccp = await helper.getCCP(org_name) //JSON.parse(ccpJSON);
   // console.log(ccp);
    console.log('============ ccp============');
    const walletPath = await helper.getWalletPath(org_name) //path.join(process.cwd(), 'wallet');
    const wallet = await Wallets.newFileSystemWallet(walletPath);
    let identity = await wallet.get(username);
    console.log(identity);
    console.log('============ identity ============');

    const gateway = new Gateway();

    console.log(gateway);

        await gateway.connect(ccp, {
            wallet, identity: username, discovery: { enabled: true, asLocalhost: true }});

        const network = await gateway.getNetwork(channelName);
        console.log(network);
        console.log('============ network ============');
        const contract = network.getContract(chaincodeName);
        result = await contract.evaluateTransaction(fnc, args[""]);
    return result
}

module.exports=  getClaimDataByClaimId