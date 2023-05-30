#!/bin/bash

set -exo pipefail

# Install win32yank
curl -L https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x86.zip -o win32yank.zip
unzip win32yank.zip -d /tmp/
cp /tmp/win32yank.exe /usr/local/bin/win32yank.exe
rm -rf /tmp/win32yank.zip /tmp/win32yank.exe /tmp/LICENSE /tmp/README.md
chmod +x /usr/local/bin/win32yank.exe
