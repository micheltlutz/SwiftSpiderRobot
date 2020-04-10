// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftSpiderRobot",
    products: [
        .executable(
            name: "SwiftSpiderRobot",
            targets: ["SwiftSpiderRobot"])
    ],
    dependencies: [
        .package(path: "Packages/Ci2c"),
        .package(path: "Packages/CioctlHelper"),
        .package(url: "https://github.com/uraimo/SwiftyGPIO.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "SwiftSpiderRobot",
            dependencies: ["SwiftyGPIO", "CioctlHelper", "Ci2c"]),
        .testTarget(
            name: "Tests",
            dependencies: ["SwiftSpiderRobot"]),
    ]
)
