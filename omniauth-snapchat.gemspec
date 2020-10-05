
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/snapchat/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-snapchat"
  spec.version       = Omniauth::Snapchat::VERSION
  spec.authors       = ["Van Pham"]
  spec.email         = ["van@tenjin.com"]

  spec.summary       = "OnmiAuth Snapchat strategy"
  spec.homepage      = "https://github.com/Ordinance/omniauth-snapchat"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.6.0"
end
