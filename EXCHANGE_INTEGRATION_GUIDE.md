# SmartCash 3.0.0 Exchange Integration Guide

## 1. Network Facts

```text
Coin: SmartCash
Symbol: SMART
Version: 3.0.0
Protocol: 90300
P2P port: 29678
RPC port: 29679
SAPI port: 28080
Explorer: http://151.252.59.32/explorer/
Bootstrap: http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz
Bootstrap checksum: http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz.sha256
```

Raw IP endpoints remain in use until final community DNS records are published.

## 2. Source And Binaries

Core source:

```text
https://github.com/SmartCashCMTY/Core-Source-Repo
```

Linux and Windows node wallet binaries:

```text
https://github.com/SmartCashCMTY/Node-Client-Wallet/releases/tag/v3.0.0
```

Explorer package:

```text
https://github.com/SmartCashCMTY/iquidus-explorer
```

## 3. Recommended Exchange Node Config

```bash
mkdir -p "$HOME/.smartcash"
chmod 700 "$HOME/.smartcash"
cat > "$HOME/.smartcash/smartcash.conf" <<'EOF'
server=1
daemon=1
listen=1
txindex=1
addressindex=1
port=29678
rpcport=29679
rpcbind=127.0.0.1
rpcallowip=127.0.0.1
rpcuser=CHANGE_ME_RPC_USER
rpcpassword=CHANGE_ME_LONG_RANDOM_PASSWORD
addnode=151.252.59.32:29678
addnode=151.252.59.33:29678
EOF
chmod 600 "$HOME/.smartcash/smartcash.conf"
```

Do not expose RPC publicly.

## 4. Bootstrap Sync

```bash
mkdir -p /tmp/smartcash3-bootstrap
cd /tmp/smartcash3-bootstrap
wget http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz
wget http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz.sha256
sha256sum -c smartcash3-bootstrap.tar.gz.sha256
```

Stop the daemon before restoring bootstrap data:

```bash
smartcash-cli stop || true
sleep 10
mkdir -p "$HOME/.smartcash"
tar -xzf /tmp/smartcash3-bootstrap/smartcash3-bootstrap.tar.gz -C "$HOME/.smartcash"
```

The bootstrap archive contains `blocks/` and `chainstate/` at archive root.

## 5. Start And Health Checks

```bash
smartcashd -daemon
smartcash-cli getblockcount
smartcash-cli getnetworkinfo
smartcash-cli getblockchaininfo
smartcash-cli getpeerinfo
```

Expected checks:

```text
version: 3.0.0
protocolversion: 90300
localservices: non-empty
blocks: increasing until synced
connections: greater than 0
```

## 6. Deposit Flow

Create deposit address:

```bash
smartcash-cli getnewaddress "customer-123"
```

Check received amount:

```bash
smartcash-cli getreceivedbyaddress "SMART_ADDRESS_HERE" 1
```

List wallet transactions:

```bash
smartcash-cli listtransactions "*" 100 0 true
```

Fetch one transaction:

```bash
smartcash-cli gettransaction "TXID_HERE"
```

No separate public exchange confirmation policy is published here. Exchanges
should choose an internal risk-based confirmation value and document it for
users.

## 7. Withdrawal Flow

Send one withdrawal:

```bash
smartcash-cli sendtoaddress "SMART_ADDRESS_HERE" 1.2345 "withdrawal" "customer-123"
```

Send batch withdrawals:

```bash
smartcash-cli sendmany "" '{"SMART_ADDRESS_1":1.23,"SMART_ADDRESS_2":4.56}'
```

Record every returned txid and reconcile after confirmation.

## 8. Monitoring

```bash
smartcash-cli getblockcount
smartcash-cli getnetworkinfo
smartcash-cli getmempoolinfo
smartcash-cli gettxoutsetinfo
smartcash-cli smartnode count
```

Suggested alerts:

- Node stopped.
- No peers.
- Block height not increasing.
- RPC unavailable.
- Disk usage high.
- Wallet balance mismatch.

## 9. Explorer API

Explorer UI:

```text
http://151.252.59.32/explorer/
```

No final public Iquidus API endpoint policy is published here. Use the Explorer
UI and local Core RPC for production integration unless your service validates
specific Explorer API paths independently.

## 10. Security Checklist

```text
RPC bound locally only: yes
Unique RPC credentials: yes
Wallet backups tested: yes
Withdrawal limits configured: yes
Manual review threshold configured: yes
Monitoring and alerts configured: yes
Cold storage policy defined: yes
```

Do not store secrets in this repository.
