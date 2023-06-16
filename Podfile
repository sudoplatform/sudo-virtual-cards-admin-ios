source 'https://github.com/CocoaPods/Specs.git'

PROJECT_NAME = 'SudoVirtualCardsAdmin'
IOS_TARGET_VERSION = '16.2'

platform :ios, IOS_TARGET_VERSION
use_frameworks!
inhibit_all_warnings!

target PROJECT_NAME do
  podspec :name => PROJECT_NAME
  pod 'SudoConfigManager', '~> 3.0'
  pod 'SudoLogging', '~> 1.0'

  target 'SudoVirtualCardsAdminTests' do
    podspec :name => PROJECT_NAME
  end
  
  target 'SudoVirtualCardsAdminIntegrationTests' do
    podspec :name => PROJECT_NAME
    pod 'SudoEntitlements', '~> 9.0'
    pod 'SudoEntitlementsAdmin', '~> 4.0'
    pod 'SudoIdentityVerification', '~> 14.0'
    pod 'SudoProfiles', '~> 17.0'
    pod 'SudoVirtualCards', '~> 22.0'
  end
end

post_install do |installer|
  # Set iOS deployment target version for all pods.
  installer.generated_projects.each do |project|
    project.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = IOS_TARGET_VERSION
    end
    project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = IOS_TARGET_VERSION
      end
    end
  end
  # Set flag `ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES` for all pods.
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if config.name == PROJECT_NAME
        config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = '$(inherited)'
      end
    end
  end
end
