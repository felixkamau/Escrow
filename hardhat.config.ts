import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import "hardhat-deploy";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    localhost:{
      url: "http://127.0.0.1:8545"
    },
    sepolia: {
      url: "https://rpc2.sepolia.org"
    }
  },
};

export default config;
