Pod::Spec.new do |spec|
  spec.name                  = 'SudoVirtualCardsAdmin'
  spec.version               = '1.0.0'
  spec.author                = { 'Sudo Platform Engineering' => 'sudoplatform-engineering@anonyome.com' }
  spec.homepage              = 'https://sudoplatform.com/'
  spec.summary               = 'Sudo Virtual Cards Admin SDK for the Sudo Platform by Anonyome Labs.'
  spec.license               = { :type => 'Apache License, Version 2.0',  :file => 'LICENSE' }
  spec.source                = { :git => 'https://github.com/sudoplatform/sudo-virtual-cards-admin-ios.git', :tag => "v#{spec.version}" }
  spec.source_files          = 'SudoVirtualCardsAdmin/**/*.swift'
  spec.ios.deployment_target = '16.2'
  spec.requires_arc          = true
  spec.swift_version         = '5.0'

  spec.dependency 'AWSAppSync', '~> 3.6.1'
  spec.dependency 'SudoConfigManager', '~> 3.0'
  spec.dependency 'SudoLogging', '~> 1.0'
end
