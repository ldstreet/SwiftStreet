// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "SwiftStreet",
    dependencies: [
        
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        
        // 🏓 A framework for converting Playgrounds and Swift files to markdown and html
        .package(url: "https://github.com/ldstreet/PlayDocs.git", from: "0.1.0"),
        
        
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "PlayDocsKit"], exclude: ["Public"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

