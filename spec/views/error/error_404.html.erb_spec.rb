require 'spec_helper'

describe 'error/error_404' do

  it 'has a header' do
    render
    assert_select 'h1', text: "404 Not Found", count: 1
  end

  it 'has an explanation' do
    render
    assert_select 'p', text: 'Whoops, looks like you tried to access something ' +
      'that doesn\'t exist. You might want to back up and try again.', count: 1
  end

  it 'has a link going back in history' do
    render
    assert_select 'a', text: 'back up', count: 1
  end
end

