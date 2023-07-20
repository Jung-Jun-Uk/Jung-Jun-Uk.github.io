# -*- encoding: utf-8 -*-
# stub: academic-jekyll-theme 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "academic-jekyll-theme".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paul Le".freeze]
  s.date = "2021-05-15"
  s.email = ["hello@paulle.ca".freeze]
  s.homepage = "https://github.com/LeNPaul/academic".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "A Jekyll theme for academia.".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<jekyll>.freeze, ["~> 4.2"])
  else
    s.add_dependency(%q<jekyll>.freeze, ["~> 4.2"])
  end
end
