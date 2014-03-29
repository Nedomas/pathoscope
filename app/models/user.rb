class User < ActiveRecord::Base
***REMOVED*** Include default devise modules. Others available are:
***REMOVED*** :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :nodes
  has_many :notes
  has_many :comments
  has_many :user_paths
  has_many :paths, through: :user_paths

  def items
    nodes.map(&:item).uniq
***REMOVED***

  def last_item_id
    items.last.andand.id
***REMOVED***

  def item_ids
    items.map(&:id)
***REMOVED***

  def self.authenticate!(email, password)
    user = User.where(email: email).first
    request_mock = OpenStruct.new(remote_ip: '123.456.789.101')
    user.update_tracked_fields!(request_mock)
    return (user.valid_password?(password) ? user : nil) unless user.nil?
    nil
***REMOVED***

  def self.current
    Thread.current[:user]
***REMOVED***

  def self.current=(user)
    Thread.current[:user] = user
***REMOVED***

***REMOVED*** def paths
***REMOVED***   nodes.map(&:path).uniq
***REMOVED*** ***REMOVED***

***REMOVED*** def paths_count
***REMOVED***   nodes.map(&:path).uniq.count
***REMOVED*** ***REMOVED***
***REMOVED***
