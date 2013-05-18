Gem::Specification.new do |spec|
  spec.name        = 'bbedit_tools'
  spec.version     = '0.0.1'
  spec.date        = '2013-05-18'
  spec.summary     = "Library for automating BBEdit"
  spec.description = "This is a library for automating BBEdit from ruby."
  spec.authors     = ["Ben Matasar"]
  spec.email       = 'ben@matasar.org'
  spec.files         = `git ls-files`.split("\n")
  spec.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  spec.require_path = 'lib'
end
