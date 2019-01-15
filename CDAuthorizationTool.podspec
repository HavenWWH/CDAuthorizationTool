#
# Be sure to run `pod lib lint CDAuthorizationTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.platform     = :ios, "8.0"
  s.name             = 'CDAuthorizationTool'
  s.version          = '0.0.1'
  s.summary          = '请求iOS各类权限'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
请求iOS各类权限
                       DESC

  s.homepage         = 'https://gitlab.ttsing.com/ios/CDAuthorizationTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cqz' => 'cqz@ttsing.com' }
  s.source           = { :git => 'git@gitlab.ttsing.com:ios/CDAuthorizationTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'


  s.source_files = 'CDAuthorizationTool/*.{h,m}'
  
  # s.resource_bundles = {
  #   'CDAuthorizationTool' => ['CDAuthorizationTool/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
