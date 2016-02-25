Pod::Spec.new do |s|
  s.name                    = 'Realm'
  s.version                 = '0.98.2'
  s.summary                 = 'Realm is a modern data framework & database for iOS & OS X.'
  s.description             = <<-DESC
                              The Realm database, for Objective-C. (If you want to use Realm from Swift, see the “RealmSwift” pod.)

                              Realm is a mobile database: a replacement for Core Data & SQLite. You can use it on iOS & OS X. Realm is not an ORM on top SQLite: instead it uses its own persistence engine, built for simplicity (& speed). Learn more and get help at https://realm.io
                              DESC
  s.homepage                = "https://realm.io"
  s.source                  = { :git => 'https://github.com/realm/realm-cocoa.git', :tag => "v#{s.version}" }
  s.author                  = { 'Realm' => 'help@realm.io' }
  s.library                 = 'c++'
  s.requires_arc            = true
  s.social_media_url        = 'https://twitter.com/realm'
  s.documentation_url       = "https://realm.io/docs/objc/#{s.version}"
  s.license                 = { :type => 'Apache 2.0', :file => 'LICENSE' }

  public_header_files       = 'include/Realm/RLMArray.h',
                              'include/Realm/RLMCollection.h',
                              'include/Realm/RLMConstants.h',
                              'include/Realm/RLMDefines.h',
                              'include/Realm/RLMListBase.h',
                              'include/Realm/RLMMigration.h',
                              'include/Realm/RLMObject.h',
                              'include/Realm/RLMObjectBase.h',
                              'include/Realm/RLMObjectSchema.h',
                              'include/Realm/RLMOptionalBase.h',
                              'include/Realm/RLMPlatform.h',
                              'include/Realm/RLMProperty.h',
                              'include/Realm/RLMRealm.h',
                              'include/Realm/RLMRealmConfiguration.h',
                              'include/Realm/RLMResults.h',
                              'include/Realm/RLMSchema.h',
                              'include/Realm/Realm.h',

                              # Realm.Dynamic module
                              'include/Realm/RLMRealm_Dynamic.h',
                              'include/Realm/RLMObjectBase_Dynamic.h'

                              # Realm.Private module
  private_header_files      = 'include/Realm/*_Private.h',
                              'include/Realm/RLMAccessor.h',
                              'include/Realm/RLMListBase.h',
                              'include/Realm/RLMObjectStore.h',
                              'include/Realm/RLMOptionalBase.h'

  source_files              = 'Realm/*.{m,mm}',
                              'Realm/ObjectStore/*.cpp',
                              'Realm/ObjectStore/impl/*.cpp',
                              'Realm/ObjectStore/impl/apple/*.cpp'

  s.module_map              = 'Realm/module.modulemap'
  s.compiler_flags          = "-DREALM_HAVE_CONFIG -DREALM_COCOA_VERSION='@\"#{s.version}\"' -D__ASSERTMACROS__"
  s.source_files            = source_files + private_header_files
  s.private_header_files    = private_header_files
  s.header_mappings_dir     = 'include'
  s.pod_target_xcconfig     = { 'CLANG_CXX_LANGUAGE_STANDARD' => 'compiler-default',
                                'OTHER_CPLUSPLUSFLAGS' => '-std=c++1y $(inherited)',
                                'APPLICATION_EXTENSION_API_ONLY' => 'YES',
                                'HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include/core"',
                                'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/Realm/include" "${PODS_ROOT}/Realm/include/Realm"' }
  s.preserve_paths          = %w(include)

  s.ios.deployment_target   = '7.0'
  s.ios.vendored_library    = 'core/librealm-ios.a'

  s.subspec 'Headers' do |sp|
    sp.source_files          = public_header_files
    sp.public_header_files   = public_header_files
  end
end
