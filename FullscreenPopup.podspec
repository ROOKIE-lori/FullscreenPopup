Pod::Spec.new do |s|
  s.name             = 'FullscreenPopup'
  s.version          = '0.1.1'
  s.summary          = 'SwiftUI 全屏遮罩弹层：传入视图与 PopupPosition 即可。'
  s.description      = <<-DESC
    基于 SwiftUI 的全屏弹窗：支持上/中/下与自定义 Alignment，可选遮罩颜色与点击关闭。
    同时支持 Swift Package Manager 与 CocoaPods。
  DESC
  s.homepage         = 'https://github.com/ROOKIE-lori/FullscreenPopup'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lori' => 'luosen0714@gmail.com' }
  s.source           = { :git => 'https://github.com/ROOKIE-lori/FullscreenPopup.git', :tag => s.version.to_s }
  s.swift_version    = '5.9'

  s.ios.deployment_target = '16.0'
  s.osx.deployment_target = '13.0'
  s.tvos.deployment_target = '16.0'
  s.watchos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*.swift'
  s.frameworks   = 'SwiftUI'
end
