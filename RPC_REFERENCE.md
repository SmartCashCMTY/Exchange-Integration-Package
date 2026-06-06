# SmartCash 3.0.0 RPC Reference For Integrators

Use local RPC only.

## Basic Node

```bash
smartcash-cli getblockcount
smartcash-cli getblockchaininfo
smartcash-cli getnetworkinfo
smartcash-cli getpeerinfo
smartcash-cli uptime
```

## Blocks And Transactions

```bash
smartcash-cli getblockhash 1000
smartcash-cli getblock "BLOCK_HASH_HERE"
smartcash-cli getrawtransaction "TXID_HERE" 1
smartcash-cli gettransaction "TXID_HERE"
```

## Wallet Deposits

```bash
smartcash-cli getnewaddress "customer-123"
smartcash-cli getreceivedbyaddress "SMART_ADDRESS_HERE" 1
smartcash-cli listtransactions "*" 100 0 true
smartcash-cli listunspent 1 9999999
```

## Wallet Withdrawals

```bash
smartcash-cli sendtoaddress "SMART_ADDRESS_HERE" 1.2345
smartcash-cli sendmany "" '{"SMART_ADDRESS_1":1.23,"SMART_ADDRESS_2":4.56}'
```

## Fees And Mempool

```bash
smartcash-cli getmempoolinfo
smartcash-cli getrawmempool
smartcash-cli gettxoutsetinfo
```

## SmartNode Visibility

```bash
smartcash-cli smartnode count
smartcash-cli smartnode list full
smartcash-cli smartnode winners 20
smartcash-cli snsync status
```

## Notes

- `txindex=1` is recommended for exchange transaction lookup.
- `addressindex=1` is recommended where address-level indexing is required.
- No separate public exchange confirmation policy is published here.
- No final public explorer API endpoint list is published here.
