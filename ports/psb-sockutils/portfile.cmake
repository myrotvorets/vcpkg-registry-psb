vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO myrotvorets/psb-sockutils-cpp
    REF 99eb788279a1f5e58d1c31c6dc5db23ab2c8e3e8
    SHA512 c43ec1d3ef8ae2d8155752d0639949e752be1a9efd9d65944c9421218d2491ed39276432cf064b354dff473c41a95ef84cb6c5cfef9ca9d320f16e9eb689cbc2
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
