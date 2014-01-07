require 'spec_helper'

describe Explore do
  let(:user) { User.create!(username: 'Dakota', email: 'having@somelaughs.com',
    password: 'mademefeelliketheone') }
  let(:second_user) { User.create!(username: 'Mayer',
    email: 'john@mayer.com', password: 'wildfire') }
  let(:aerospace_path) { Path.create!(title: 'Aerospace') }
  let(:programming_path) { Path.create!(title: 'Programming') }
  let(:wiki_url) { 'http://en.wikipedia.org/wiki/Aerospace_engineering' }
  let(:lecture_url) { 'http://freevideolectures.com/Course/2303/Aircraft-Systems-Engineering' }
  let(:nasa_url) { 'http://nasa.com' }
  let(:forces_url) { 'http://4forces.com' }
  let(:shuttle_url) { 'http://shuttle.com' }
  let(:ruby_tuts_url) { 'http://rubytuts.com' }
  let(:rails_intro_url) { 'http://mhartlrailsintro.com' }

  before(:each) do
    stub_request(:any, /(.*)/)

  ***REMOVED*** Aerospace path
  ***REMOVED*** User 1
    wiki_node = Node.build(wiki_url, aerospace_path, user)
    lecture_node = Node.build(lecture_url, aerospace_path, user)
    nasa_node = Node.build(nasa_url, aerospace_path, user)
    shuttle_node = Node.build(shuttle_url, aerospace_path, user)
  ***REMOVED*** User 2
    nasa_node_2 = Node.build(nasa_url, aerospace_path, second_user)
    forces_node = Node.build(forces_url, aerospace_path, second_user)

  ***REMOVED*** Programming path
  ***REMOVED*** User 1
    ruby_tuts_node = Node.build(ruby_tuts_url, programming_path, user)
    rails_intro_node = Node.build(rails_intro_url, programming_path, user)
    wiki_node_2 = Node.build(wiki_url, programming_path, user)
  ***REMOVED*** User 2
    ruby_tuts_node = Node.build(ruby_tuts_url, programming_path, second_user)
    forces_node_2 = Node.build(forces_url, programming_path, second_user)
***REMOVED***

  it 'show correct links for root nodes' do
    expect(Explore.node_urls(aerospace_path.roots)).to eq([wiki_url, nasa_url])
***REMOVED***

  it 'show path root links' do
    expect(Explore.root_links(aerospace_path).map(&:url)).to eq([wiki_url,
      nasa_url])
    expect(Explore.root_links(programming_path).map(&:url)).to eq([
      ruby_tuts_url])
***REMOVED***

  it 'show children links' do
  ***REMOVED*** P1
    wiki_link = Link.find_by(url: wiki_url)
    expect(Explore.children_links(wiki_link).map(&:url)).to eq([lecture_url])

    lecture_link = Link.find_by(url: lecture_url)
    expect(Explore.children_links(lecture_link).map(&:url)).to eq([nasa_url])

    nasa_link = Link.find_by(url: nasa_url)
    expect(Explore.children_links(nasa_link).map(&:url)).to eq([forces_url,
      shuttle_url])

  ***REMOVED*** P2
    ruby_tuts_link = Link.find_by(url: ruby_tuts_url)
    expect(Explore.children_links(ruby_tuts_link).map(&:url)).to eq([
      forces_url, rails_intro_url])
***REMOVED***
***REMOVED***

