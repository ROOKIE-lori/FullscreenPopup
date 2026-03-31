# FullscreenPopup

SwiftUI 全屏遮罩弹层：通过 `fullscreenPopup` 传入内容视图，并用 `PopupPosition` 或 `Alignment` 控制位置。

**环境：** iOS 16+ / macOS 13+ / tvOS 16+ / watchOS 9+，Swift 5.9+。

## Swift Package Manager

在 Xcode 中选择 **File → Add Package Dependencies…**，填入：

`https://github.com/ROOKIE-lori/FullscreenPopup.git`

版本选择 **Up to Next Major** 从 `0.1.1` 起（需仓库存在对应 Tag）。

或在应用的 `Package.swift` 中加入：

```swift
dependencies: [
    .package(
        name: "FullscreenPopup",
        url: "https://github.com/ROOKIE-lori/FullscreenPopup.git",
        from: "0.1.1"
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
pod 'FullscreenPopup', '~> 0.1.1'
```

本地开发时可将 `:path` 指向克隆后的仓库根目录（含 `FullscreenPopup.podspec`），例如：

```ruby
pod 'FullscreenPopup', :path => '../FullscreenPopup'
```

然后执行 `pod install`。

## 使用

在需要使用的文件中：

```swift
import SwiftUI
import FullscreenPopup
```

在任意 `View` 上链式调用 `fullscreenPopup(isPresented:position:content:)` 或 `fullscreenPopup(isPresented:alignment:content:)`。用 `@State` 或 `@Binding` 控制是否展示。

**示例：**

```swift
struct Demo: View {
    @State private var show = false

    var body: some View {
        Button("打开") { show = true }
            .fullscreenPopup(isPresented: $show, position: .center) {
                Text("内容")
            }
    }
}
```

**位置 `PopupPosition`：**

| 枚举 | 含义 |
| --- | --- |
| `.top` | 贴近安全区顶部 |
| `.center` | 垂直居中（默认） |
| `.bottom` | 贴近安全区底部 |
| `.custom(Alignment)` | 用 SwiftUI 对齐方式定位，如 `.topLeading`、`.bottomTrailing` |

也可用 `alignment:` 重载，等价于 `position: .custom(alignment)`：

```swift
.fullscreenPopup(isPresented: $show, alignment: .bottomTrailing) {
    Text("右下角附近")
}
```

**可选参数（均有默认值）：**

- `dimmedColor`：遮罩颜色，默认 `Color.black.opacity(0.45)`。遮罩层会铺满**整屏**（不随按钮等小视图裁切），需要更明显时可自行加深，例如：
  ```swift
  .fullscreenPopup(isPresented: $show, position: .center, dimmedColor: Color.black.opacity(0.6)) {
      Text("内容")
  }
  ```
- `dismissOnBackgroundTap`：点击遮罩是否关闭，默认 `true`
- `animation`：显隐动画，默认弹簧动画；传 `nil` 则走隐式动画

库版本字符串：`FullscreenPopupInfo.version`。
