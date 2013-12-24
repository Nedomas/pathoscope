require 'spec_helper'

describe Node do
  let(:user) { User.create!(username: 'Dakota', email: 'having@somelaughs.com',
    password: 'mademefeelliketheone') }
  let(:path) { Path.create!(title: 'Aerospace') }
  let(:url) { 'http://en.wikipedia.org/wiki/Aerospace_engineering' }

  it 'should build all parts' do
    binding.pry
***REMOVED***
***REMOVED***
