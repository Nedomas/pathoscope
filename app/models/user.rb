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

  def item_ids
    items.map(&:id)
***REMOVED***

***REMOVED*** def paths
***REMOVED***   nodes.map(&:path).uniq
***REMOVED*** ***REMOVED***

***REMOVED*** def paths_count
***REMOVED***   nodes.map(&:path).uniq.count
***REMOVED*** ***REMOVED***
***REMOVED***
