platform :ios, '12.0'

use_frameworks!
inhibit_all_warnings!

target 'ShotOne' do
  
  pod 'TableKit'
  pod 'Utils', :source => 'https://github.com/iznv/Podspecs.git'

end


# Fix warning:
# The iOS Simulator deployment target 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0,
# but the range of supported deployment target versions is 9.0 to 14.2.99.

post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      end
    end
  end
