# SmartCash 3 Exchange Integration Package

## Projektbeschreibung

Compact integration package for exchanges, payment processors, explorers and
other SmartCash 3.0.0 third-party services.

## Schnellstart

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

## Systemanforderungen

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

## Konfiguration

```bash
mkdir -p "$HOME/.smartcash"
chmod 700 "$HOME/.smartcash"
cp smartcash.conf.exchange.example "$HOME/.smartcash/smartcash.conf"
chmod 600 "$HOME/.smartcash/smartcash.conf"
nano "$HOME/.smartcash/smartcash.conf"
```

Replace all placeholders before starting production services.

## Update-Anleitung

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

## Backup-Anleitung

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

## Sicherheitshinweise

- Never hardcode passwords, private keys, recovery words or API keys.
- Never expose RPC to the public internet.
- Keep RPC bound to `127.0.0.1` or a private network only.
- Use unique random RPC credentials.
- Keep deposit and withdrawal reconciliation logs.
- Test withdrawals on a staging node before production.

## Credits

Original SmartCash Projekt:
https://github.com/smartcash

Dieses Repository ist ein Fork bzw. eine Weiterentwicklung auf Basis der
Open-Source-Arbeiten des SmartCash-Projekts. Alle Rechte an den ursprünglichen
Komponenten, Marken, Logos, Quellcodes und Dokumentationen verbleiben bei den
jeweiligen Rechteinhabern. Der ursprüngliche Creator sowie alle relevanten
Open-Source-Beiträge müssen angemessen genannt werden.

## Lizenz

This package contains documentation and configuration examples for SmartCash
3.0.0 integrations. SmartCash Core is MIT licensed according to the original
`COPYING` file in the Core source repository. Third-party components include
Bitcoin-Core-derived code, Berkeley DB, Boost, OpenSSL, Qt, libevent, ZeroMQ and
other build/runtime dependencies.

TODO: Bitte Lizenz des Originalprojekts prüfen und Drittanbieter-Lizenzen vor
kommerzieller Nutzung final verifizieren.

## Haftungsausschluss

Nutzung erfolgt auf eigene Gefahr. Es gibt keine Garantie auf Funktionalität,
Verfügbarkeit oder Sicherheit. Es wird keine Haftung für direkte oder indirekte
Schäden, Datenverlust, finanzielle Verluste, Wallet-Verluste, verlorene Private
Keys, Fehlkonfigurationen, Netzwerk- oder Blockchain-Probleme, Softwarefehler
oder Sicherheitslücken übernommen.

## Kryptowährungs-Risiken

Kryptowährungen sind hochriskante digitale Vermögenswerte. Kursverluste bis hin
zum Totalverlust sind möglich. Staking- und Node-Betrieb bergen technische
Risiken. Nutzer sind selbst für die Sicherung ihrer Wallets, lokale Gesetze und
steuerliche Pflichten verantwortlich.

## Rechtlicher Hinweis

Die Nutzung hat im Einklang mit den jeweils geltenden lokalen Gesetzen und
Vorschriften zu erfolgen. Nutzer sind selbst verantwortlich für regulatorische,
steuerliche und rechtliche Anforderungen ihres Landes. Diese Dokumentation ist
keine Rechts-, Steuer- oder Finanzberatung.
