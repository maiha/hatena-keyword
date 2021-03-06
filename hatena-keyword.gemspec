# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{hatena-keyword}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["maiha"]
  s.date = %q{2010-01-14}
  s.description = %q{hatena keyword api}
  s.email = %q{maiha@wota.jp}
  s.extra_rdoc_files = ["README", "MIT-LICENSE"]
  s.files = ["MIT-LICENSE", "README", "Rakefile", "lib/hatena.rb", "lib/hatena-keyword.rb", "lib/hatena", "lib/hatena/null.rb", "lib/hatena/keyword.rb", "spec/provide_helper.rb", "spec/keyword_spec.rb", "spec/its_helper.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/maiha/hatena-keyword}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{asakusarb}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{hatena keyword api}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<dsl_accessor>, [">= 0.3.3"])
    else
      s.add_dependency(%q<dsl_accessor>, [">= 0.3.3"])
    end
  else
    s.add_dependency(%q<dsl_accessor>, [">= 0.3.3"])
  end
end
