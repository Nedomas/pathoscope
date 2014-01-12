class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

***REMOVED*** NOTE: install the acts_as_votable plugin if you
***REMOVED*** want user to vote on the quality of comments.
***REMOVED***acts_as_voteable

***REMOVED*** NOTE: Comments belong to a user
  belongs_to :user
***REMOVED***
