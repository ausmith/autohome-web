require 'spec_helper'

describe 'error/error_500' do

  it 'has a header' do
    render
    assert_select 'h1', text: "500 Internal Server Error", count: 1
  end

  it 'has an explanation' do
    render
    assert_select 'p', text: 'Whoops, looks like something went off the rails a ' +
      'bit. Sorry about that! You might want to back up and try again.', count: 1
  end

  it 'has a link going back in history' do
    render
    assert_select 'a', text: 'back up', count: 1
  end
end

