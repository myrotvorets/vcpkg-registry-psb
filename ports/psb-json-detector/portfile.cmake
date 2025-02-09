vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO myrotvorets/psb-json-detector
    REF ac8cdff42cdbc3e4a747920edb7047df7910698d
    SHA512 fca40c37aad838ef7700207778f04abadf21b134fcd0e01f440ff263bdef1da394f4ea67f2e9e4686d417f0f966ee9dab09b635aba9b096d968a1b861b6c46b4
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTING=OFF -DBUILD_BENCHMARKS=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME psb-json-detector CONFIG_PATH "lib/cmake/psb-json-detector")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
