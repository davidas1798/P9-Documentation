lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "p6/version"

Gem::Specification.new do |spec|
  spec.name          = "p6"
  spec.version       = P6::VERSION
  spec.authors       = ["David Arteaga Sánchez"]
  spec.email         = ["alu0101039664@ull.edu.es"]

  spec.summary       = %q{P6 - Lenguajes y Paradigmal de Programación - ULL}
  spec.description   = %q{Información nutricional de alimentos}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-davidas1798.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
end
