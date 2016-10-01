Gem::Specification.new do |s|
  s.name          = 'catawiki'
  s.version       = '0.0.0'
  s.date          = '2016-10-01'
  s.summary       = 'Catawiki'
  s.description   = 'Catawiki'
  s.authors       = ['Mohammad AbuShady']
  s.email         = 'mohammad@abushady.com'
  s.files         = ['lib/catawiki.rb']
  s.require_paths = ['lib']
  s.homepage      = 'http://github.com/coalwater/catawiki'
  s.required_ruby_version = '~> 2.3'
  s.executables << 'catawiki'
  s.files         = Dir[
    'lib/**/*',
    'LICENCE',
  ]
  s.license       = 'GPL-3.0'
end

