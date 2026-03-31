# FullscreenPopup

SwiftUI 全屏遮罩弹层：通过 `fullscreenPopup` 传入内容视图，并用 `PopupPosition` 或 `Alignment` 控制位置。

**环境：** iOS 16+ / macOS 13+ / tvOS 16+ / watchOS 9+，Swift 5.9+。

## Swift Package Manager

在 Xcode 中选择 **File → Add Package Dependencies…**，填入：

`https://github.com/ROOKIE-lori/FullscreenPopup.git`

版本选择 **Up to Next Major** 从 `0.1.0` 起（需仓库存在对应 Tag）。

或在应用的 `Package.swift` 中加入：

```swift
dependencies: [
    .package(
        name: "FullscreenPopup",
        url: "https://github.com/ROOKIE-lori/FullscreenPopup.git",
        from: "0.1.0"
    )
],
targets: [
    .target(
        name: "YourApp",
        dependencies: [
            .product(name: "FullscreenPopup", package: "FullscreenPopup")
        ]
    )
]
```

## CocoaPods

在 `Podfile` 中：

```ruby
pod 'FullscreenPopup', '~> 0.1.0'
```

本地开发时可将 `:path` 指向克隆后的仓库根目录（含 `FullscreenPopup.podspec`），例如：

```ruby
pod 'FullscreenPopup', :path => '../FullscreenPopup'
```

然后执行 `pod install`。
