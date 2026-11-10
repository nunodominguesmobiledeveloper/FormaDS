// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - Package

let package = Package(
    name: "FormaDS",
    defaultLocalization: "en",

    // MARK: - Platforms

    platforms: [
        .iOS(.v17)
    ],

    // MARK: - Products

    products: [
        .library(
            name: "FormaDS",
            targets: ["FormaDS"]
        )
    ],

    // MARK: - Targets

    targets: [
        .target(
            name: "FormaDS",
            resources: [
                .process("Resources")
            ]
        ),

        .testTarget(
            name: "FormaDSTests",
            dependencies: ["FormaDS"]
        )
    ]
)
