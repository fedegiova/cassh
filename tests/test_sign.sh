#!/bin/bash

KEY_URLENCODE=$(echo "$GUEST_B_PRIV_KEY" | python -c "import urllib.parse;import sys;print(urllib.parse.quote(sys.stdin.read()))")
RESP=$(curl -s -X POST -d "username=${GUEST_B_USERNAME}&realname=${GUEST_B_REALNAME}&password=${GUEST_B_PASSWORD}&pubkey=${KEY_URLENCODE}" "${CASSH_SERVER_URL}"/client)
if [[ "${RESP}" =~ .*Trying\ to\ use\ private\ key\ for\ signing.* ]]; then
    echo "[OK] Test signing with private key"
else
    echo "[FAIL ${BASH_SOURCE}:+${LINENO}] Test signing key with private key: ${RESP}"
fi
