#!/bin/bash
# shellcheck disable=SC2128

####################################
### ADD GUEST B WITH ANOTHER NAME ##
####################################
#RESP=$(curl -s -X PUT -d "username=${GUEST_B_USERNAME_BIS}&realname=${GUEST_B_REALNAME}&password=${GUEST_B_PASSWORD}&pubkey=${GUEST_B_PUB_KEY}" "${CASSH_SERVER_URL}"/client)
#if [ "${RESP}" == "Create user=${GUEST_B_USERNAME_BIS}. Pending request." ]; then
#    echo "[OK] Test add user ${GUEST_B_USERNAME}"
#else
#    echo "[FAIL ${BASH_SOURCE}:+${LINENO}] Test add user ${GUEST_B_USERNAME_BIS} : ${RESP}"
#fi
#
#################################
### ADMIN ACTIVATE GUEST B BIS ##
#################################
#RESP=$(curl -s -X POST -d "realname=${SYSADMIN_REALNAME}&password=${SYSADMIN_PASSWORD}" "${CASSH_SERVER_URL}"/admin/"${GUEST_B_USERNAME_BIS}")
#if [ "${RESP}" == "Active user=${GUEST_B_USERNAME_BIS}. SSH Key active but need to be signed." ]; then
#    echo "[OK] Test admin active ${GUEST_B_USERNAME_BIS}"
#else
#    echo "[FAIL ${BASH_SOURCE}:+${LINENO}] Test admin active ${GUEST_B_USERNAME_BIS} : ${RESP}"
#fi

#######################################
## STATUS GUEST B WITH MULTIPLE KEYS ##
#######################################
RESP=$(curl -s -X POST -d "realname=${GUEST_B_REALNAME}&password=${GUEST_B_PASSWORD}" "${CASSH_SERVER_URL}"/client/status | jq '.[] | .status')
if [ "${RESP}" == $'"ACTIVE"\n"ACTIVE"' ]; then
    echo "[OK] Test status pending user"
else
    echo "[FAIL ${BASH_SOURCE}:+${LINENO}] Test status pending user : ${RESP}"
fi

