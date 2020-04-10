// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "CioctlHelper",
    products: [
        .library(name: "CioctlHelper", targets: ["CioctlHelper"]),
    ],
    targets: [
        .systemLibrary(name: "CioctlHelper", path: "."),
    ]
)
)
