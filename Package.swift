// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SwiftStreet",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        //.package(url: "https://github.com/vapor-community/markdown.git", .upToNextMajor(from: "0.4.0"))
        .package(url: "https://github.com/PerfectlySoft/Perfect-Markdown.git",
                 from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "PerfectMarkdown"], exclude: ["Public"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

