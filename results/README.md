# Supported RPC methods for various 
| METHOD | https://eth.llamarpc.com | https://eth.merkle.io | https://rpc.flashbots.net |
|-----|-----|-----|-----|
| debug_getRawBlock | ❌ | ❌ | ❌ | 
| debug_getRawHeader | ❌ | ❌ | ❌ | 
| debug_getRawReceipts | ❌ | ❌ | ❌ | 
| debug_getRawTransaction | ❌ | ❌ | ❌ | 
| eth_accounts | ✅ | ✅ | ✅ | 
| eth_blobBaseFee | ✅ | ✅ | ❌ | 
| eth_blockNumber | ✅ | ✅ | ✅ | 
| eth_call | ✅ | ✅ | ✅ | 
| eth_chainId | ✅ | ✅ | ✅ | 
| eth_coinbase | ✅ | ✅ | ❌ | 
| eth_createAccessList | ❌ | ❌ | ❌ | 
| eth_estimateGas | ✅ | ✅ | ✅ | 
| eth_feeHistory | ✅ | ✅ | ✅ | 
| eth_gasPrice | ✅ | ✅ | ✅ | 
| eth_getBalance | ✅ | ✅ | ✅ | 
| eth_getBlockByHash | ✅ | ✅ | ✅ | 
| eth_getBlockByNumber | ✅ | ✅ | ✅ | 
| eth_getBlockReceipts | ✅ | ✅ | ❌ | 
| eth_getBlockTransactionCountByHash | ✅ | ✅ | ✅ | 
| eth_getBlockTransactionCountByNumber | ✅ | ✅ | ✅ | 
| eth_getCode | ✅ | ✅ | 
| eth_getLogs | ✅ | ✅ | ✅ | 
| eth_getProof | ✅ | ✅ | ✅ | 
| eth_getStorageAt | ✅ | ✅ | 
| eth_getTransactionByBlockHashAndIndex | ✅ | ✅ | 
| eth_getTransactionByBlockNumberAndIndex | ✅ | ✅ | ✅ | 
| eth_getTransactionByHash | ✅ | ✅ | ✅ | 
| eth_getTransactionCount | ✅ | ✅ | ✅ | 
| eth_getTransactionReceipt | ✅ | ✅ | ✅ | 
| eth_getUncleCountByBlockHash | ✅ | ✅ | ✅ | 
| eth_getUncleCountByBlockNumber | ❌ | ❌ | ❌ | 
| eth_maxPriorityFeePerGas | ✅ | ✅ | ✅ | 
| eth_newBlockFilter | ❌ | ❌ | ✅ | 
| eth_newFilter | ❌ | ❌ | ❌ | 
| eth_newPendingTransactionFilter | ❌ | ❌ | ❌ | 
| eth_sendRawTransaction | ❌ | ❌ | ❌ | 
| eth_syncing | ✅ | ✅ | ✅ | 