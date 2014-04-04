#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "OptionalBlockAnimation"
  s.version          = "0.1.0"
  s.summary          = "A UIView category that adds a boolean option to all animate... class methods"
  s.description      = <<-DESC
                       An optional longer description of OptionalBlockAnimation

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/iosengineer/OptionalBlockAnimation/"
  #s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Adam Iredale" => "adam@bionicmonocle.com" }
  s.source           = { :git => "https://github.com/iosengineer/OptionalBlockAnimation.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/iosengineer'

  s.platform     = :ios, '7.1'
  s.ios.deployment_target = '7.0'
  s.requires_arc = false

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  s.framework = 'UIKit'
end
