#
# Be sure to run `pod lib lint SABaseKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SABaseKit'
  s.version          = '0.1.5'
  s.summary          = 'A short description of SABaseKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Gityuns 修改内容：1、UICollectionView 只用1个cell时左对齐；2、pod文件按文件夹分组"

  s.homepage         = 'https://github.com/Gityuns/SABaseKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gityuns' => '2434783536@qq.com' }
  s.source           = { :git => 'https://github.com/Gityuns/SABaseKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SABaseKit/Classes/**/*'
  
  s.resources = ['SABaseKit/SABaseKit.bundle']

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'AFNetworking'
  s.dependency 'SDWebImage'
  s.dependency 'Masonry'
  s.dependency 'MJExtension'
  s.dependency 'SVProgressHUD'
  s.dependency 'MJRefresh'
  s.dependency 'IQKeyboardManager'
end
