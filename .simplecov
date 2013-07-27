require 'coveralls'

SimpleCov.start 'rails' do
  project_name 'Autohome Web'
  coverage_dir 'public/coverage'

  add_filter '/spec/'
  add_filter '/features/'

  use_merging true
  formatter SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
end
