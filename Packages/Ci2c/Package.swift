// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "Ci2c",
    // dependencies: [],
    products: [
        .library(name: "Ci2c", targets: ["Ci2c"])
    ],
    targets: [
        .systemLibrary(name: "Ci2c", path: ".")
    ]
)