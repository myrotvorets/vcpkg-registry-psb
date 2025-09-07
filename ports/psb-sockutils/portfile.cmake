vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO myrotvorets/psb-sockutils-cpp
    REF db4709698307e307604dbfdf3bc3527b36f4caa4
    SHA512 22ff810d93a69d47ff726540230c77ac68bae586e0d4ea3813aeb0ebb22c59600cdcbba93c19d8db5ef0291a9bbbfc7f76fc423be7394f75e5dac48980f62a79
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTING=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME psb-sockutils CONFIG_PATH "lib/cmake/psb-sockutils")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
