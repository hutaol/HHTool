#
# Be sure to run `pod lib lint HHTool.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'HHTool'
  s.version          = '0.5.0'
  s.summary          = '一些简单的工具类'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
集成Toast, Alert, MBProgressHUD, HXPhotoPicker, YBPopupMenu, DZNEmptyDataSet封装的工具类及常用的分类(UIButton的图片和文字位置显示, 控件多次点击限制, UIImageView的圆角, UIColor, NSString, NSDate, UIView等)
                       DESC

  s.homepage         = 'https://github.com/hutaol/HHTool'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Henry' => '1325049637@qq.com' }
  s.source           = { :git => 'https://github.com/hutaol/HHTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'HHTool/Classes/**/*'
  s.resources   = 'HHTool/Assets/*'

  s.vendored_libraries = 'HHTool/Classes/Lame/libmp3lame.a'
  
  s.dependency 'Toast', '~> 4.0.0'
  s.dependency 'SPAlertController', '~> 4.0.0'
  s.dependency 'MBProgressHUD', '~> 1.2.0'
  s.dependency 'HXPhotoPicker', '~> 3.2.4'
  s.dependency 'HXPhotoPicker/SDWebImage_AF', '~> 3.2.4'
  s.dependency 'YBPopupMenu', '~> 1.1.9'
  s.dependency 'DZNEmptyDataSet', '~> 1.8.1'
  
end
