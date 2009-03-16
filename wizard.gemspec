# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{wizard}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["taelor"]
  s.date = %q{2009-03-14}
  s.default_executable = %q{make_wizardly}
  s.description = %q{a wizardly floating panel}
  s.email = ["thredden@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/wizard.rb", "lib/wizard/view_helpers.rb", "html/javascripts/jquery.ui.wizard.js", "html/javascripts/wizard.js", "html/stylesheets/wizard.css", "bin/make_wizardly", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_wizard.rb"]
  s.has_rdoc = false
  s.homepage = %q{}
  s.post_install_message = %q{PostInstall.txt}
  s.executables = ['make_wizardly']
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib", "lib/wizard"]
  s.rubyforge_project = %q{wizard}
  s.rubygems_version = %q{1.3.1}
  s.summary = s.description
  s.test_files = ["test/test_helper.rb", "test/test_wizard.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
