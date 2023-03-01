Gem::Specification.new do |s|
  s.name        = 'duration'
  s.version     = '0.0.1'
  s.licenses    = ['MIT']
  s.summary     = "Calulates duration in timestamps"
  s.description = "Gem to calculate and update model attributes that represent lengths of time."
  s.authors     = ["Paul Anthony McGowan"]
  s.email       = 'xhostcom@aol.com'
  s.homepage    = s.metadata['source_code_uri'] = 'https://github.com/xhostcom/duration'
  s.files = Dir['lib/**/*.rb', 'README.md']
  s.require_paths = ['lib']
  s.add_dependency 'activesupport', '~> 7.0', '>= 7.0.1'
  s.add_dependency 'activerecord', '~> 7.0', '>= 7.0.1'
  s.add_dependency 'metasploit-concern', '~> 5.0', '>= 5.0.1'
  s.add_dependency 'metasploit-model', '~> 5.0', '>= 5.0.1'
end
