class User < ActiveRecord::Base
***REMOVED*** Include default devise modules. Others available are:
***REMOVED*** :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :paths
  has_many :nodes
  has_many :comments

  def paths
    nodes.map(&:path).uniq
***REMOVED***

  def paths_count
    paths.count
***REMOVED***
***REMOVED***
