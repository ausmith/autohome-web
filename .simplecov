SimpleCov.start 'rails' do
  coverage_dir 'public/coverage'
  add_filter '/spec/'
  add_filter '/features/'
end
