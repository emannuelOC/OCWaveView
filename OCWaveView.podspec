Pod::Spec.new do |s|

  s.name         = "OCWaveView"
  s.version      = "0.2"
  s.summary      = "🌊 A UIView subclass to present visual feedback for audio input"

  s.description  = "OCWaveView is a UIView subclass that can present visual feedback for audio input."

  s.homepage     = "https://github.com/emannuelOC/OCWaveView"
  s.license      = { :type => "MIT", :file => "LICENSE" }


  s.author             = { "Emannuel Carvalho" => "emannuel.carvalho@icloud.com" }
  s.social_media_url   = "http://twitter.com/emannuel_oc"

  s.platform     = :ios, "10.0"

  s.swift_versions = '5.0'
  
  s.source       = { :git => "https://github.com/emannuelOC/OCWaveView.git", :tag => "0.2" }

  s.source_files  = "OCWaveView", "Sources/**/*.{h,m,swift}"

  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5' }
end
