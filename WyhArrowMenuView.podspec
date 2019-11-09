#
# Be sure to run `pod lib lint WyhArrowMenuView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WyhArrowMenuView'
  s.version          = '1.0.0'
  s.summary          = 'You can easy show an arrow-menu view used by WyhArrowMenuView .'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/XiaoWuTongZhi/WyhArrowMenuView'
  s.screenshots     = 'https://raw.githubusercontent.com/XiaoWuTongZhi/Github-Images/master/misc/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '609223770@qq.com' => '609223770@qq.com' }
s.source           = { :git => 'git@github.com:XiaoWuTongZhi/WyhArrowMenuView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WyhArrowMenuView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'WyhArrowMenuView' => ['WyhArrowMenuView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
