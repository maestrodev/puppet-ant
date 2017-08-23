require 'puppetlabs_spec_helper/rake_tasks'

Rake::Task[:lint].clear # workaround https://github.com/rodjek/puppet-lint/issues/331
PuppetLint.configuration.relative = true # https://github.com/rodjek/puppet-lint/pull/334
PuppetLint.configuration.send('disable_arrow_on_right_operand_line')
PuppetLint::RakeTask.new :lint do |config|
  config.pattern = 'manifests/**/*.pp'
  config.disable_checks = ["80chars", "class_inherits_from_params_class"]
  config.fail_on_warnings = true
end

task :default => [:clean, :validate, :lint, :spec]
