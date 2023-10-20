// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Steelyard",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(name: "steelyard", targets: ["Steelyard"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/Kitura/Swift-JWT", .upToNextMajor(from: "4.0.1")),
        .package(url: "https://github.com/apple/swift-http-types", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "AppStoreConnect",
            dependencies: [
                .product(name: "SwiftJWT", package: "Swift-JWT"),
                .product(name: "HTTPTypes", package: "swift-http-types"),
                .product(name: "HTTPTypesFoundation", package: "swift-http-types"),
            ]
        ),
        .target(
            name: "Commands",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Rainbow", package: "Rainbow"),
                .target(name: "AppStoreConnect"),
                .target(name: "Platform"),
                .target(name: "UI"),
            ]
        ),
        .target(
            name: "Platform"
        ),
        .executableTarget(
            name: "Steelyard",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .target(name: "Commands"),
            ]
        ),
        .target(
            name: "UI"
        ),
    ]
)
