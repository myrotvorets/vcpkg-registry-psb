vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO myrotvorets/psb-sockutils-cpp
    REF 8f157320792859b2263e0b9a09ec23adf20dcb91
    SHA512 dd943d6ff61eab31fc7f2f043a9a34fe7012246d06b0987e6f79c69feb6ddcf3fe2c317d53ad69a80989f81d307e0ed1b7fb8d987d49b25c3cdcc7834bde9927
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
