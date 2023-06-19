PROJECT_NAME = 'SudoVirtualCardsAdmin'
IOS_TARGET_VERSION = '15.0'

platform :ios, IOS_TARGET_VERSION
use_frameworks!
inhibit_all_warnings!

target PROJECT_NAME do
  inherit! :search_paths
  podspec :name => PROJECT_NAME

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

# Set iOS deployment target version for all pods.
post_install do |installer|
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = IOS_TARGET_VERSION
      end
    end
  end
end
