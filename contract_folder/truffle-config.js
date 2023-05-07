module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // for more about customizing your Truffle configuration!

  compilers:{
    solc:{
      version: "^0.8.0"
    }
  },
  
  networks: {
    develop: {
      //port: 8545
      host: "127.0.0.1",     // Localhost (default: none)
      port: 7545,            // Standard Ethereum port (default: none)
      network_id: "5777",       // Any network (default: none)
    }
  }
};