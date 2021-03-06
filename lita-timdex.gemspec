Gem::Specification.new do |spec|
  spec.name          = "lita-timdex"
  spec.version       = "0.1.0"
  spec.authors       = ["Jeremy Prevost"]
  spec.email         = ["jprevost@mit.edu"]
  spec.description   = "TIMDEX handler for lita bot"
  spec.summary       = "TIMDEX handler for lita bot"
  spec.homepage      = "https://github.com/MITLibraries/lita-timdex"
  spec.license       = "Apache 2.0"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.7"
  spec.add_runtime_dependency 'timdex-ruby', '0.1.4 '

  spec.add_development_dependency "bundler", ">= 2.0"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rspec", ">= 3.0.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "dotenv", "~> 2"
  spec.add_development_dependency "jwt"

end
