source 'https://github.com/CocoaPods/Specs'

platform :ios, '8.0'

# Add Application pods here


use_frameworks!
target "MovileUpTest", :exclusive => true do
    pod 'Alamofire'
    pod 'Result'
    pod 'Kingfisher'
end

target :unit_tests, :exclusive => true do
  link_with 'UnitTests'
  pod 'Specta'
  pod 'Expecta'
  pod 'OCMock'
  pod 'OHHTTPStubs'
  pod 'Alamofire'
  pod 'Result'
  #pod 'TraktModels', :git => 'https://github.com/marcelofabri/TraktModles.git'
end

# Copy acknowledgements to the Settings.bundle

post_install do | installer |
  require 'fileutils'

  pods_acknowledgements_path = 'Pods/Target Support Files/Pods/Pods-Acknowledgements.plist'
  settings_bundle_path = Dir.glob("**/*Settings.bundle*").first

  if File.file?(pods_acknowledgements_path)
    puts 'Copying acknowledgements to Settings.bundle'
    FileUtils.cp_r(pods_acknowledgements_path, "#{settings_bundle_path}/Acknowledgements.plist", :remove_destination => true)
  end
end

