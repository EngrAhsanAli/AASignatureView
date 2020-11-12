Pod::Spec.new do |s|
s.name             = 'AASignatureView'
s.version          = '1.0'
s.summary          = 'AASignatureView is a UIView to capture digital signature by drawing it on screen easily in iOS, written in Swift.'

s.description      = <<-DESC
AASignatureView is a customised storyboard based UIView class that allows to capture digital signature easily without writing code.
DESC

s.homepage         = 'https://github.com/EngrAhsanAli/AASignatureView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Engr. Ahsan Ali' => 'hafiz.m.ahsan.ali@gmail.com' }
s.source           = { :git => 'https://github.com/EngrAhsanAli/AASignatureView.git', :tag => s.version.to_s }
s.ios.deployment_target = '9.0'

s.source_files = 'AASignatureView/Classes/**/*'
s.swift_version = '5.0'
end
