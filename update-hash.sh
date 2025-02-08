#!/bin/sh

BASE_DIR="$(dirname "$(readlink -fn "${0}")")"
PORT_NAME="${1}"

if [ ! -d "${BASE_DIR}/ports/${PORT_NAME}" ]; then
    echo "Port ${PORT_NAME} not found"
    exit 1
fi

if [ ! -f "${BASE_DIR}/ports/${PORT_NAME}/portfile.cmake" ]; then
    echo "Port ${PORT_NAME} is missing portfile.cmake file"
    exit 1
fi

REPO="$(awk '/^\s*REPO / { print $2 }' "${BASE_DIR}/ports/${PORT_NAME}/portfile.cmake")"
REF="$(awk '/^\s*REF / { print $2 }' "${BASE_DIR}/ports/${PORT_NAME}/portfile.cmake")"
HASH="$(awk '/^\s*SHA512 / { print $2 }' "${BASE_DIR}/ports/${PORT_NAME}/portfile.cmake")"

if [ -z "${REPO}" ] || [ -z "${REF}" ] || [ -z "${HASH}" ]; then
    echo "Unable to determine REPO, REF or SHA512 for port ${PORT_NAME}"
    exit 1
fi

URL="https://github.com/${REPO}/archive/${REF}.tar.gz"
NEW_HASH="$(curl -sfL "${URL}" | sha512sum -b | awk '{ print $1 }')"

if [ "${HASH}" != "${NEW_HASH}" ]; then
    echo "Hash mismatch for port ${PORT_NAME}"
    echo "Expected: ${HASH}"
    echo "Actual: ${NEW_HASH}"
    sed -i "s/SHA512 ${HASH}/SHA512 ${NEW_HASH}/" "${BASE_DIR}/ports/${PORT_NAME}/portfile.cmake"
fi
