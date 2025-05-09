#
# Be sure to run `pod lib lint XTableView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'XTableView'
  s.version          = '1.0.8'
  s.summary          = 'A short description of XTableView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/jowsing/XTableView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jowsing' => 'jowsing169@gmail.com' }
  s.source           = { :git => 'https://github.com/jowsing/XTableView.git', :tag => s.version.to_s }

  s.source_files = 'Sources/**/*'
  
  s.swift_version = ['5.0']
  
  s.ios.deployment_target = "11.0"
  
end
