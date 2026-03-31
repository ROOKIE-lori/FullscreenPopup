import SwiftUI

/// 全屏遮罩 + 按位置摆放内容的弹窗修饰符。
public struct FullscreenPopupModifier<PopupContent: View>: ViewModifier {
    @Binding private var isPresented: Bool
    private let position: PopupPosition
    private let dimmedColor: Color
    private let dismissOnBackgroundTap: Bool
    private let animation: Animation?
    @ViewBuilder private let popupContent: () -> PopupContent

    public init(
        isPresented: Binding<Bool>,
        position: PopupPosition,
        dimmedColor: Color = Color.black.opacity(0.45),
        dismissOnBackgroundTap: Bool = true,
        animation: Animation? = .spring(response: 0.35, dampingFraction: 0.86),
        @ViewBuilder popupContent: @escaping () -> PopupContent
    ) {
        _isPresented = isPresented
        self.position = position
        self.dimmedColor = dimmedColor
        self.dismissOnBackgroundTap = dismissOnBackgroundTap
        self.animation = animation
        self.popupContent = popupContent
    }

    public func body(content: Content) -> some View {
        content
            .overlay {
                ZStack {
                    if isPresented {
                        dimmedColor
                            .ignoresSafeArea()
                            .contentShape(Rectangle())
                            .onTapGesture {
                                if dismissOnBackgroundTap {
                                    withAnimation(animation) {
                                        isPresented = false
                                    }
                                }
                            }
                            .transition(.opacity)

                        positionedContent
                            .transition(.opacity.combined(with: positionTransition))
                    }
                }
                .animation(animation, value: isPresented)
                .allowsHitTesting(isPresented)
            }
    }

    @ViewBuilder
    private var positionedContent: some View {
        switch position {
        case .top:
            VStack(spacing: 0) {
                popupContent()
                Spacer(minLength: 0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding(.top, 0)

        case .center:
            ZStack {
                popupContent()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .bottom:
            VStack(spacing: 0) {
                Spacer(minLength: 0)
                popupContent()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

        case .custom(let alignment):
            popupContent()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
        }
    }

    private var positionTransition: AnyTransition {
        switch position {
        case .top:
            return .move(edge: .top).combined(with: .opacity)
        case .center:
            return .scale(scale: 0.92).combined(with: .opacity)
        case .bottom:
            return .move(edge: .bottom).combined(with: .opacity)
        case .custom:
            return .opacity
        }
    }
}
