@preconcurrency import ProjectDescription

let iOSTargetVersion = "17.0"

let linterScript: TargetScript = .pre(
    path: "Scripts/swiftlint.sh",
    arguments: [],
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
)

let linterTarget: Target = .target(
    name: "SwiftLint",
    destinations: .macOS,
    product: .commandLineTool,
    bundleId: "com.PrettyButtonSDK.SwiftLint",
    scripts: [linterScript]
)

let kittyButtonTarget: Target = .target(
    name: "KittyButton",
    destinations: .iOS,
    product: .framework,
    productName: "KittyButtonSDK",
    bundleId: "com.PrettyButtonSDK.KittyButton",
    deploymentTargets: .iOS(iOSTargetVersion),
    infoPlist: .default,
    sources: [
        "PrettyButtonSDK/KittyButton/**/*.swift"
    ],
    scripts: [linterScript]
)

let prettyButtonSDKSample: Target = .target(
    name: "PrettyButtonSDKSample",
    destinations: [.iPhone],
    product: .app,
    bundleId: "com.PrettyButtonSDK.sdk-sample",
    deploymentTargets: .iOS(iOSTargetVersion),
    infoPlist: .file(path: "PrettyButtonSDKSample/Info.plist"),
    sources: [
        "PrettyButtonSDKSample/**/*.swift"
    ],
    resources: [
        "PrettyButtonSDKSample/Assets.xcassets"
    ],
    dependencies: [
        .target(kittyButtonTarget)
    ]
)

let project = Project(
    name: "PrettyButtonSDK",
    organizationName: "HSE",
    options: .options(
      textSettings: .textSettings(
        usesTabs: false,
        indentWidth: 4,
        tabWidth: 4
      )
    ),
    targets: [
        linterTarget,
        kittyButtonTarget,
        prettyButtonSDKSample
    ]
)
