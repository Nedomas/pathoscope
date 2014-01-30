class User < ActiveRecord::Base
***REMOVED*** Include default devise modules. Others available are:
***REMOVED*** :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :nodes
  has_many :comments
  has_many :user_paths
  has_many :paths, through: :user_paths

***REMOVED*** def paths
***REMOVED***   nodes.map(&:path).uniq
***REMOVED*** ***REMOVED***

  def paths_count
    nodes.map(&:path).uniq.count
***REMOVED***
***REMOVED***
