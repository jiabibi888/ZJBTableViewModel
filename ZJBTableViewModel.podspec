#
# Be sure to run `pod lib lint ZJBTableViewModel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZJBTableViewModel'
  s.version          = '0.2.0'
  s.summary          = 'TableViewModel方便UITableView的开发'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TableViewModel方便UITableView的开发，便于UI修改迭代
                       DESC

  s.homepage         = 'https://github.com/jiabibi888/ZJBTableViewModel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jabir' => 'zjb11934@ly.com' }
  s.source           = { :git => 'https://github.com/jiabibi888/ZJBTableViewModel.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  # s.source_files = 'ZJBTableViewModel/Classes/**/*'
  s.vendored_frameworks = "ZJBTableViewModel/FrameWork/ZJBTableViewModel.framework"
  
  # s.resource_bundles = {
  #   'ZJBTableViewModel' => ['ZJBTableViewModel/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
