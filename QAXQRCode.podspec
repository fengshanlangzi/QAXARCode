#
# Be sure to run `pod lib lint QAXQRCode.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QAXQRCode'
  s.version          = '0.1.0'
  s.summary          = 'my QAXQRCode.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 支持横屏扫码
                       DESC

  s.homepage         = 'https://github.com/fengshanlangzi/QAXQRCode'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dufangyi' => 'fangyi890115@163.com' }
  s.source           = { :git => 'https://github.com/fengshanlangzi/QAXQRCode.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # s.ios.deployment_target = '10.0'

  s.source_files = 'QAXQRCode/Classes/**/*'
  
  # s.resource =  'QAXQRCode/Assets/SGQRCode.bundle'
  s.resource_bundles = {
     # 'QAXQRCode' => ['QAXQRCode/Assets/QAXQRCode.bundle']
      'QAXQRCode' => ['QAXQRCode/Assets/*']
  }
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
    # s.dependency 'XMGFMBase/Category'
end
