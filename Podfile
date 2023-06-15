source 'https://github.com/CocoaPods/Specs.git'

platform :ios, "16.2"
use_frameworks!
inhibit_all_warnings!

target "SudoVirtualCardsAdmin" do
  podspec :name => 'SudoVirtualCardsAdmin'
  
  pod 'SudoConfigManager', '~> 3.0'
  pod 'SudoLogging', '~> 1.0'
end

target "SudoVirtualCardsAdminTests" do
  podspec :name => 'SudoVirtualCardsAdmin'
end

target "SudoVirtualCardsAdminIntegrationTests" do
  podspec :name => 'SudoVirtualCardsAdmin'
  
  pod 'SudoEntitlements', '~> 9.0'
  pod 'SudoEntitlementsAdmin', '~> 4.0'
  pod 'SudoIdentityVerification', '~> 14.0'
  pod 'SudoProfiles', '~> 17.0'
  pod 'SudoVirtualCards', '~> 22.0'
end
