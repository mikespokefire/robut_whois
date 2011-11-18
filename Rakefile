#!/usr/bin/env rake
require "bundler/gem_tasks"

# RSpec
require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
  spec.rspec_opts = ['--color']
end

# Testing should be the default task
task default: :spec
