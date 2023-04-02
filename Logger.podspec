
Pod::Spec.new do |s|

  s.name         = "Additive"
  s.version      = "1.0.0"
  s.summary      = "Additive"
  s.description  = "Additive is a set of extensions over some primitive swift classes."
  s.homepage     = "https://github.com/hamed8080/additive"
  s.license      = "MIT"
  s.author       = { "Hamed Hosseini" => "hamed8080@gmail.com" }
  s.platform     = :ios, "10.0"
  s.swift_versions = "4.0"
  s.source       = { :git => "https://github.com/hamed8080/additive.git", :tag => s.version }
  s.source_files = "Sources/Additive/**/*.{h,swift,xcdatamodeld,m,momd}"
  s.resources = "Sources/Additive/Resources/*.xcdatamodeld"
  s.frameworks  = "Foundation"

end
