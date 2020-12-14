// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NeuronWebAPISDK",
    platforms: [
        .iOS(.v13),.macOS(.v10_15), .tvOS(.v13), .watchOS(.v5)
    ],
    products: [
        .library(
            name: "NeuronWebAPISDK",
            targets: ["NeuronWebAPISDK"]),
    ],
    dependencies: [
      .package(name: "SimpleApiClient",
               url: "https://github.com/wvabrinskas/SimpleAPIClient.git",
               from: "1.0.11"),
    ],
    targets: [
        .target(
            name: "NeuronWebAPISDK",
            dependencies: [ "SimpleApiClient" ]),
        .testTarget(
            name: "NeuronWebAPISDKTests",
            dependencies: ["NeuronWebAPISDK"]),
    ]
)
