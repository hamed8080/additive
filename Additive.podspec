Pod::Spec.new do |s|
  s.name         = "Additive"
  s.version      = "1.2.2"
  s.summary      = "Additive"
  s.description  = "Additive is a set of extensions over some primitive swift classes."
  s.homepage     = "https://pubgi.sandpod.ir/chat/ios/additive"
  s.license      = "MIT"
  s.author       = { "Hamed Hosseini" => "hamed8080@gmail.com" }
  s.platform     = :ios, "10.0"
  s.swift_versions = "4.0"
  s.source       = { :git => "https://pubgi.sandpod.ir/chat/ios/additive", :tag => s.version }
  s.source_files = "Sources/Additive/**/*.{h,swift,xcdatamodeld,m,momd}"
  s.frameworks  = "Foundation" , "CoreData"
end
