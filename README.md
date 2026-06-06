# SmartCash 3 Exchange Integration Package

## Project Description

Compact integration package for exchanges, payment processors, explorers and
other SmartCash 3.0.0 third-party services.

## Quick Start

```bash
git clone https://github.com/SmartCashCMTY/Exchange-Integration-Package.git
cd Exchange-Integration-Package
cp smartcash.conf.exchange.example smartcash.conf
```

Read first:

```text
EXCHANGE_INTEGRATION_GUIDE.md
RPC_REFERENCE.md
```

## System Requirements

- SmartCash 3.0.0 daemon or node wallet.
- Linux server for production daemon deployments.
- Local RPC access only, protected by firewall and strong credentials.
- Enough disk space for full blockchain data. TODO final recommended disk size.

## Installation

Install node client binaries from GitHub:

```bash
mkdir -p /tmp/smartcash3-node-wallet
cd /tmp/smartcash3-node-wallet
wget https://github.com/SmartCashCMTY/Node-Client-Wallet/releases/download/v3.0.0/smartcash3-3.0.0-x86_64-linux-gnu.tar.gz
wget https://github.com/SmartCashCMTY/Node-Client-Wallet/releases/download/v3.0.0/SHA256SUMS
sha256sum -c SHA256SUMS --ignore-missing
tar -xzf smartcash3-3.0.0-x86_64-linux-gnu.tar.gz
sudo install -m 0755 linux-x86_64/smartcashd /usr/local/bin/smartcashd
sudo install -m 0755 linux-x86_64/smartcash-cli /usr/local/bin/smartcash-cli
```

## Configuration

```bash
mkdir -p "$HOME/.smartcash"
chmod 700 "$HOME/.smartcash"
cp smartcash.conf.exchange.example "$HOME/.smartcash/smartcash.conf"
chmod 600 "$HOME/.smartcash/smartcash.conf"
nano "$HOME/.smartcash/smartcash.conf"
```

Replace all placeholders before starting production services.

## Update Guide

```bash
smartcash-cli stop || true
sleep 10
cd /tmp/smartcash3-node-wallet
rm -rf linux-x86_64 smartcash3-3.0.0-x86_64-linux-gnu.tar.gz SHA256SUMS
wget https://github.com/SmartCashCMTY/Node-Client-Wallet/releases/download/v3.0.0/smartcash3-3.0.0-x86_64-linux-gnu.tar.gz
wget https://github.com/SmartCashCMTY/Node-Client-Wallet/releases/download/v3.0.0/SHA256SUMS
sha256sum -c SHA256SUMS --ignore-missing
tar -xzf smartcash3-3.0.0-x86_64-linux-gnu.tar.gz
sudo install -m 0755 linux-x86_64/smartcashd /usr/local/bin/smartcashd
sudo install -m 0755 linux-x86_64/smartcash-cli /usr/local/bin/smartcash-cli
smartcashd -daemon
```

## Backup Guide

For wallet-based services:

```bash
smartcash-cli stop || true
sleep 10
mkdir -p "$HOME/smartcash-backups"
cp "$HOME/.smartcash/wallet.dat" "$HOME/smartcash-backups/wallet.dat.$(date +%Y%m%d-%H%M%S)"
cp "$HOME/.smartcash/smartcash.conf" "$HOME/smartcash-backups/smartcash.conf.$(date +%Y%m%d-%H%M%S)"
```

For watch-only or external-custody services, back up configuration, database
state and reconciliation records according to your internal security policy.

## Credits

Original SmartCash project:
https://github.com/smartcash

This repository is a fork and continuation based on the open-source work of the
SmartCash project. All rights to original components, trademarks, logos, source
code and documentation remain with their respective rights holders. The original
creator and all relevant open-source contributors should be credited
appropriately.

## License

This package contains documentation and configuration examples for SmartCash
3.0.0 integrations. SmartCash Core is MIT licensed according to the original
`COPYING` file in the Core source repository. Third-party components include
Bitcoin-Core-derived code, Berkeley DB, Boost, OpenSSL, Qt, libevent, ZeroMQ and
other build/runtime dependencies.

TODO: Review the original project license and verify third-party licenses before
commercial use.

## Disclaimer

Use at your own risk. No guarantee is provided for functionality, availability
or security. No liability is accepted for direct or indirect damages, data loss,
financial losses, wallet losses, lost private keys, misconfiguration, network or
blockchain problems, software defects or security vulnerabilities.

## Cryptocurrency Risks

Cryptocurrencies are high-risk digital assets. Price losses up to total loss are
possible. Staking and node operation involve technical risks. Users are solely
responsible for securing their wallets, complying with local laws and meeting
tax obligations.

## Legal Notice

Use must comply with applicable local laws and regulations. Users are solely
responsible for regulatory, tax and legal requirements in their country. This
documentation does not provide legal, tax or financial advice.
