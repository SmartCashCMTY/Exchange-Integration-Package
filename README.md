# Exchange-Integration-Package 3.0.0

SmartCash 3.0.0 integration package for exchanges, payment processors, explorers, and custody services.

## What It Does
- Provides RPC and configuration examples for production integrations
- Documents daemon setup, wallet handling, and service backup basics
- Points integrations to the SmartCash 3.0.0 community release assets

## Quick Start
```bash
git clone https://github.com/SmartCashCMTY/Exchange-Integration-Package.git
cd Exchange-Integration-Package
cp smartcash.conf.exchange.example smartcash.conf
```

## System Requirements
- SmartCash 3.0.0 daemon or node wallet
- Linux server for production daemon deployments
- Local RPC access protected by firewall and strong credentials
- 30 GB free disk space minimum, 50 GB or more for production services

## Installation
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

Replace all placeholder RPC values before production use.

## Update
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

## Backup
```bash
smartcash-cli stop || true
sleep 10
mkdir -p "$HOME/smartcash-backups"
cp "$HOME/.smartcash/wallet.dat" "$HOME/smartcash-backups/wallet.dat.$(date +%Y%m%d-%H%M%S)"
cp "$HOME/.smartcash/smartcash.conf" "$HOME/smartcash-backups/smartcash.conf.$(date +%Y%m%d-%H%M%S)"
```

For external-custody services, back up configuration, database state, and reconciliation records under your own security policy.

## Security
- Use local RPC only unless you fully understand the exposure
- Never commit credentials, wallet files, seed phrases, private keys, or API keys
- Use strong RPC credentials and firewall rules

## Credits
Original SmartCash Project: https://github.com/smartcash
This repository is an Update 3.0.0 based on the open-source work of the SmartCash project.
All rights to original components, trademarks, logos, source code, and documentation remain with their respective owners.
The original creator and relevant open-source contributors should be acknowledged appropriately.

## License
SmartCash Core components are generally released under MIT. Third-party components keep their own licenses.
Please check the original project license.

## Disclaimer
Use at your own risk. No warranty is provided for functionality, availability, or security. No liability is accepted for direct or indirect damages, data loss, wallet loss, lost private keys, misconfiguration, network issues, blockchain issues, software bugs, or security vulnerabilities.

## Cryptocurrency Risks
Cryptocurrencies are high-risk digital assets. Losses, including total loss, are possible. Node operation and staking-related workflows may fail or behave unexpectedly. You are responsible for wallet backups, local law compliance, and tax obligations.

## Legal Notice
Use this software in accordance with the laws and regulations that apply in your jurisdiction. You are responsible for regulatory, tax, and legal compliance in your country. No legal, tax, or financial advice is provided.
