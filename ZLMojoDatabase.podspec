Pod::Spec.new do |s|
  s.name                  = "ZLMojoDatabase"
  s.version               = "1.5"
  s.summary               = "MojoDatabase is an ActiveRecord-like ORM for SQLite written in Objective-C for use in iOS applications."
  s.homepage              = "https://github.com/zhoulincome/mojo-database"
  s.social_media_url      = "https://github.com/zhoulincome/mojo-database"
  s.platform     = :ios,'6.0'
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "zhoulin” => “359344816@qq.com" }
  s.source                = { :git => "https://github.com/zhoulincome/mojo-database.git",:tag=> s.version}
  s.ios.deployment_target = "6.0"
  s.source_files = 'MojoDatabase/*.{h,m}'
  s.frameworks = "AVFoundation"
  s.libraries = "sqlite3"
  s.requires_arc = true
  
end
