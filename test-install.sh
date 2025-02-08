#!/bin/sh

BASE_DIR="$(dirname "$(readlink -fn "${0}")")"
PORT_NAME="${1}"

if [ ! -d "${BASE_DIR}/ports/${PORT_NAME}" ]; then
    echo "Port ${PORT_NAME} not found"
    exit 1
fi

for i in vcpkg.json portfile.cmake; do
    if [ ! -f "${BASE_DIR}/ports/${PORT_NAME}/${i}" ]; then
        echo "Port ${PORT_NAME} is missing ${i} file"
        exit 1
    fi
done

vcpkg install --overlay-ports="${BASE_DIR}/ports" "${PORT_NAME}" && vcpkg remove "${PORT_NAME}"
