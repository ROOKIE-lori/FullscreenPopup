import SwiftUI

/// 全屏弹窗内内容的锚点位置。
public enum PopupPosition: Sendable, Equatable {
    /// 贴近安全区顶部
    case top
    /// 屏幕垂直居中
    case center
    /// 贴近安全区底部
    case bottom
    /// 使用 SwiftUI `Alignment` 在全屏容器内对齐（如 `.topLeading`、`.center`、`.bottomTrailing`）。
    case custom(Alignment)
}
