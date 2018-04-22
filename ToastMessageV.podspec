#
# Be sure to run `pod lib lint ToastMessageV.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ToastMessageV'
  s.version          = '0.1.0'
  s.summary          = 'ToastMessageV shows short time alert.'


# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ToastMessageV shows short time alert. Install library into project, Never have to write this generic code again.
                       DESC

  s.homepage         = 'https://github.com/ishusuvagia@gmail.com/ToastMessageV'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mitu1742000@gmail.com' }
  s.source           = { :git => 'https://github.com/mitu1742000@gmail.com/ToastMessageV.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.resources = 'ToastMessageV/Resources/*.xib'
  s.ios.deployment_target = '8.0'

  s.source_files = 'ToastMessageV/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ToastMessageV' => ['ToastMessageV/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
