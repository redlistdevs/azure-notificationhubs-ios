// swift-tools-version:5.0

// Copyright (c) Microsoft Corporation. All rights reserved.

import PackageDescription

let package = Package(
    name: "WindowsAzureMessaging",
    platforms: [
        .iOS(.v9),
        .macOS(.v10_10),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WindowsAzureMessaging",
            type: .static,
            targets: ["WindowsAzureMessaging"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "WindowsAzureMessaging",
            path: "WindowsAzureMessaging/WindowsAzureMessaging",
            exclude: ["Support"],
            cSettings: [
                .define("NH_C_VERSION", to:"\"3.1.5\""),
                .define("NH_C_BUILD", to:"\"1\""),
                .headerSearchPath("."),
                .headerSearchPath("Helpers"),
                .headerSearchPath("HttpClient"),
                .headerSearchPath("HttpClient/Util"),
                .headerSearchPath("Internal"),
                .headerSearchPath("Internal/DelegateForwarder"),
                .headerSearchPath("Model"),
                .headerSearchPath("Model/Internal"),
                .headerSearchPath("Util"),
                .headerSearchPath("Vendor/Reachability"),
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UserNotifications"),
                .linkedFramework("AppKit", .when(platforms: [.macOS])),
                .linkedFramework("UIKit", .when(platforms: [.iOS, .tvOS]))
            ]
        )
    ]
)
