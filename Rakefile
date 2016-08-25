require 'rake'
require 'rspec/core/rake_task'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'
require 'puppetlabs_spec_helper/module_spec_helper'

PuppetSyntax.future_parser = true

def git_submodules()
  exclude = []
  Dir.glob("modules/*") { |x|
    if File.exist?(x + '/.git')
       exclude << x + "/**/*"
    end
  }
  exclude
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  file_list = FileList['modules/*/spec/**/*_spec.rb']
  git_submodules.each do |exclude|
     file_list = file_list.exclude(exclude)
  end

  t.rspec_opts = ['--color']
  t.pattern = file_list
end

desc "Generate the docs"
RSpec::Core::RakeTask.new(:doc) do |t|
  t.rspec_opts = ['--format', 'documentation']
  t.pattern = 'modules/spec/*/*_spec.rb'
end


ignore_paths = ["vendor/**/*.pp"] + git_submodules

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ignore_paths
  config.log_format = '%{path}:%{linenumber}:%{check}:%{KIND}:%{message}'
  config.disable_checks = [ "class_parameter_defaults", "class_inherits_from_params_class", "80chars" ]
  config.fail_on_warnings = true
end

PuppetSyntax.exclude_paths = ["vendor/**/*"] + git_submodules

task :default => :test

task :test => [
  :syntax,
  :lint,
  :spec,
]
