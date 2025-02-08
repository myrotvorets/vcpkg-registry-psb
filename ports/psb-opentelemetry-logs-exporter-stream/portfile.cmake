vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO myrotvorets/psb-opentelemetry-logs-exporter-stream
    REF 1837c313841c306a55d40313675299426b0ca3b9
    SHA512 440c18080a46da42c3af83ae2ab7e6529ca6e28d7ba92013c40544e321e04e25e4b1b716ebd162d17fdf5d858811875db014d8d78d5fd7e05b34d216ff4ed3d0
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME psb-opentelemetry-logs-exporter-stream CONFIG_PATH "lib/cmake/psb-opentelemetry-logs-exporter-stream")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
