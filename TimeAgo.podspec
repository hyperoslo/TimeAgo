Pod::Spec.new do |s|
  s.name             = "TimeAgo"
  s.summary          = "A helper for creating human-readable strings from NSDate"
  s.version          = "0.1.0"
  s.homepage         = "https://github.com/hyperoslo/TimeAgo"
  s.license          = {
    :type => 'MIT',
    :file => 'LICENSE.md'
  }
  s.author           = {
    "Hyper" => "ios@hyper.no"
  }
  s.source           = {
    :git => "https://github.com/hyperoslo/TimeAgo.git",
    :tag => s.version.to_s
  }
  s.social_media_url = 'https://twitter.com/hyperoslo'
  s.ios.deployment_target = "8.0"
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source/**/*'
  s.resources = 'Resources/**'

  s.frameworks = 'Foundation'
end
