module.exports = {

  plugins: [
    "@chainsafe/truffle-plugin-abigen"
  ],

  compilers: {
    solc: {
      version: "0.8.15",      // Fetch exact version from solc-bin (default: truffle's version)
      // docker: true,        // Use "0.5.1" you've installed locally with docker (default: false)
      // parser: "solcjs",
      settings: {
        optimizer: {
          enabled: true,
        },
        evmVersion: "istanbul",
        outputSelection: {
          "*": {
            "*": [
              "abi",
              "bin",
              "userdoc",
              "devdoc",
              "metadata",
              "evm.bytecode", // Enable the metadata and bytecode outputs of every single contract.
              "evm.bytecode.sourceMap" // Enable the source map output of every single contract.
            ],
          },
        },
        debug: {
          // How to treat revert (and require) reason strings. Settings are
          // "default", "strip", "debug" and "verboseDebug".
          // "default" does not inject compiler-generated revert strings and keeps user-supplied ones.
          // "strip" removes all revert strings (if possible, i.e. if literals are used) keeping side-effects
          // "debug" injects strings for compiler-generated internal reverts, implemented for ABI encoders V1 and V2 for now.
          // "verboseDebug" even appends further information to user-supplied revert strings (not yet implemented)
          "revertStrings": "default"
        },
      },
    }
  },
};
