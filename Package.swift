// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "FullscreenPopup",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9)
    ],
    products: [
        .library(name: "FullscreenPopup", targets: ["FullscreenPopup"])
    ],
    targets: [
        .target(name: "FullscreenPopup", path: "Sources")
    ]
)
