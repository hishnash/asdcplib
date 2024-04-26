// swift-tools-version: 5.10
import PackageDescription

let CXXDefine: [CXXSetting] = [
    .define("VERSION", to: #""2.13.1""#),
    .define("ASDCP_PLATFORM", to: #""unix""#),
    .define("PACKAGE_VERSION", to: #""2.13.1""#),
    .define("HAVE_OPENSSL"),
]

let package = Package(
    name: "AS-DCP",
    products: [
        /// Libs
        .library(name: "libkumu", type: .static, targets: ["libkumu"]),
        .library(name: "libas02", type: .static, targets: ["libas02"]),
        .library(name: "libasdcp", type: .static, targets: ["libasdcp"]),
        
        
        /// Executables
        .executable(name: "blackwave", targets: ["blackwave"]),
        .executable(name: "wavesplit", targets: ["wavesplit"]),
        .executable(name: "kmuuidgen", targets: ["kmuuidgen"]),
        .executable(name: "kmrandgen", targets: ["kmrandgen"]),
        .executable(name: "kmfilegen", targets: ["kmfilegen"]),
        .executable(name: "klvwalk", targets: ["klvwalk"]),
        .executable(name: "asdcp-test", targets: ["asdcp-test"]),
        .executable(name: "asdcp-wrap", targets: ["asdcp-wrap"]),
        .executable(name: "asdcp-unwrap", targets: ["asdcp-unwrap"]),
        .executable(name: "asdcp-info", targets: ["asdcp-info"]),
        .executable(name: "asdcp-util", targets: ["asdcp-util"]),
        .executable(name: "j2c-test", targets: ["j2c-test"]),
        .executable(name: "as-02-wrap", targets: ["as-02-wrap"]),
        .executable(name: "as-02-wrap-iab", targets: ["as-02-wrap-iab"]),
        .executable(name: "as-02-unwrap", targets: ["as-02-unwrap"]),
        .executable(name: "as-02-info", targets: ["as-02-info"]),
    ],
    targets: [
        .executableTarget(
            name: "as-02-unwrap",
            dependencies: ["libas02", "libasdcp", "libkumu"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "as-02-wrap-iab",
            dependencies: ["libas02", "libasdcp", "libkumu"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "as-02-wrap",
            dependencies: ["libas02", "libasdcp", "libkumu"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "j2c-test",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "asdcp-util",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "asdcp-info",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "asdcp-unwrap",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "asdcp-wrap",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "asdcp-test",
            dependencies: ["libasdcp"], cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "klvwalk",
            dependencies: [
                "libkumu",
                "libas02",
                "libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "kmfilegen",
            dependencies: [
                "libkumu",
                "libas02",
                "libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "kmrandgen",
            dependencies: [
                "libkumu",
                "libas02",
                "libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "kmuuidgen",
            dependencies: [
                "libkumu",
                "libas02",
                "libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "wavesplit",
            dependencies: ["libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "blackwave",
            dependencies: ["libasdcp"],
            cxxSettings: CXXDefine
        ),
        
        .executableTarget(
            name: "as-02-info",
            dependencies: ["libas02", "libasdcp", "libkumu"],
            publicHeadersPath: "",
            cxxSettings: CXXDefine
        ),
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "libkumu",
                dependencies: ["openssl"],
                publicHeadersPath: "",
                cxxSettings: CXXDefine
            ),
        .target(
            name: "libasdcp",
            dependencies: [
                "openssl",
                "libkumu",
                "libas02"
            ],
            publicHeadersPath: "",
            cxxSettings: CXXDefine
        ),
        .target(
            name: "libas02",
            dependencies: ["openssl", "libkumu"],
            publicHeadersPath: "",
            cxxSettings: CXXDefine
        ),
        .systemLibrary(
           name: "openssl",
           pkgConfig: "openssl",
           providers: [
               .brew(["openssl"])
           ]
       ),        
    ]
)
