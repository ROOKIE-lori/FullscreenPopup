import SwiftUI

public extension View {
    /// 在当前视图上叠加全屏弹窗：传入自定义 `View` 与 `PopupPosition` 即可。
    ///
    /// - Parameters:
    ///   - isPresented: 是否显示。
    ///   - position: `.top` / `.center` / `.bottom` / `.custom(Alignment)`。
    ///   - dimmedColor: 背景遮罩颜色，默认半透明黑。
    ///   - dismissOnBackgroundTap: 点击遮罩是否关闭。
    ///   - animation: 显示/隐藏动画；传 `nil` 则使用隐式动画。
    ///   - content: 弹窗主体视图。
    func fullscreenPopup<Content: View>(
        isPresented: Binding<Bool>,
        position: PopupPosition = .center,
        dimmedColor: Color = Color.black.opacity(0.45),
        dismissOnBackgroundTap: Bool = true,
        animation: Animation? = .spring(response: 0.35, dampingFraction: 0.86),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        modifier(
            FullscreenPopupModifier(
                isPresented: isPresented,
                position: position,
                dimmedColor: dimmedColor,
                dismissOnBackgroundTap: dismissOnBackgroundTap,
                animation: animation,
                popupContent: content
            )
        )
    }

    /// 使用 `Alignment` 自定义弹层在全屏区域内的对齐方式，等价于 `position: .custom(alignment)`。
    func fullscreenPopup<Content: View>(
        isPresented: Binding<Bool>,
        alignment: Alignment,
        dimmedColor: Color = Color.black.opacity(0.45),
        dismissOnBackgroundTap: Bool = true,
        animation: Animation? = .spring(response: 0.35, dampingFraction: 0.86),
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        fullscreenPopup(
            isPresented: isPresented,
            position: .custom(alignment),
            dimmedColor: dimmedColor,
            dismissOnBackgroundTap: dismissOnBackgroundTap,
            animation: animation,
            content: content
        )
    }
}
