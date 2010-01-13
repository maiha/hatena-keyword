require 'rubygems'
require 'rake/gempackagetask'

GEM_NAME = "hatena-keyword"
AUTHOR = "maiha"
EMAIL = "maiha@wota.jp"
HOMEPAGE = "http://github.com/maiha/hatena-keyword"
SUMMARY = "hatena keyword api"
GEM_VERSION = "0.0.1"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'asakusarb'
  s.executables = []
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.require_path = 'lib'
  s.add_dependency('dsl_accessor', '>= 0.3.3')
  s.files = %w(MIT-LICENSE README Rakefile) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

require 'spec/rake/spectask'
desc 'Default: run spec examples'
task :default => 'spec'
