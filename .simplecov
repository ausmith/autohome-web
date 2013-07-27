SimpleCov.start 'rails' do
  project_name 'Autohome Web'
  coverage_dir 'public/coverage'

  add_filter '/spec/'
  add_filter '/features/'

  use_merging true
end
