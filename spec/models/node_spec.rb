require 'spec_helper'

describe Node do
  let(:user) { User.create!(username: 'Dakota', email: 'having@somelaughs.com',
    password: 'mademefeelliketheone') }
  let(:second_user) { User.create!(username: 'Mayer',
    email: 'john@mayer.com', password: 'wildfire') }
  let(:aerospace_path) { Path.create!(title: 'Aerospace') }
  let(:wiki_url) { 'http://en.wikipedia.org/wiki/Aerospace_engineering' }
  let(:lecture_url) { 'http://freevideolectures.com/Course/2303/Aircraft-Systems-Engineering' }

  before(:each) do
    stub_request(:any, wiki_url).to_return(body: '<title>Mocked title</title>')
    stub_request(:any, lecture_url)
  end

  it 'should build all parts' do
    Node.build(wiki_url, aerospace_path, user)
    link = Link.last
    expect(link.url).to eq(wiki_url)
    # expect(link.title).to eq('Mocked title')
  end

  it 'should build different nodes with same link' do
    first_node = Node.build(wiki_url, aerospace_path, user)
    second_node = Node.build(wiki_url, aerospace_path, second_user)
    expect(Link.count).to eq(1)
    expect(first_node.link_id).to eq(second_node.link_id)
  end

  it 'should go down the tree for single user on a single aerospace_path' do
    first_node = Node.build(wiki_url, aerospace_path, user)
    second_node = Node.build(lecture_url, aerospace_path, user)
    expect(first_node.ancestry).to eq(nil)
    expect(second_node.ancestry).to eq("#{first_node.id}")
  end

  it 'should be careful of duplicates' do
    first_node = Node.build(wiki_url, aerospace_path, user)
    second_node = Node.build(wiki_url, aerospace_path, user)
    expect(first_node == second_node).to eq(true)
  end

end
