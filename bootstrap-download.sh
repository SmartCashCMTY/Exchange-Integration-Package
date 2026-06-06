#!/usr/bin/env bash
set -euo pipefail

BOOTSTRAP_URL="http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz"
CHECKSUM_URL="http://151.252.59.32/bootstrap/smartcash3-bootstrap.tar.gz.sha256"
TARGET_DIR="${1:-/tmp/smartcash3-bootstrap}"

mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

wget -O smartcash3-bootstrap.tar.gz "$BOOTSTRAP_URL"
wget -O smartcash3-bootstrap.tar.gz.sha256 "$CHECKSUM_URL"
sha256sum -c smartcash3-bootstrap.tar.gz.sha256

echo "Bootstrap downloaded and verified in $TARGET_DIR"
