Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_admin_activity_tracker'
  s.version     = '1-0-stable'
  s.summary     = 'Add spree admin activity tracker for spree greater than 4.0'
  s.required_ruby_version = '>= 2.3.6'
  s.files = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']

  s.author    = ['Al-khadher Alqiari']
  s.email     = 'khadher@hotmail.com'

  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.0.0'

  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_auth_devise', spree_version
  s.add_dependency 'spree_extension'
  s.add_development_dependency 'appraisal'
end
