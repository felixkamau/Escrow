
import { buildModule } from '@nomicfoundation/hardhat-ignition/modules';

const SELLER_ADDRESS = '0x70997970C51812dc3A010C7d01b50e0d17dc79C8';
const ESCROW_AGENT_ADDRESS = '0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC';
const escrowModule = buildModule("Escrow",(m) => {
    const seller = m.getParameter("seller",SELLER_ADDRESS);
    const escrowAgent = m.getParameter("escrowAgent",ESCROW_AGENT_ADDRESS);


    const escrow = m.contract("Escrow",[seller, escrowAgent]);


    return {escrow};
});

export default escrowModule;