
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "option_max_pain/version"

Gem::Specification.new do |spec|
  spec.name          = "option_max_pain"
  spec.version       = OptionMaxPain::VERSION
  spec.authors       = ["Owais"]
  spec.email         = ["owaiswiz@gmail.com"]

  spec.summary       = %q{Automatically calculate max pain of options listed on the National Stock Exchange of India, or through custom data}
  spec.homepage      = "https://github.com/owaiswiz/OptionMaxPain"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
end
