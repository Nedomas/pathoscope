class Invitation < ActiveRecord::Base
  validate :valid_email

  def valid_email
    unless email.match(/.+\@.+\..+/)
      errors.add(:email, 'seems to be invalid')
***REMOVED***
***REMOVED***
***REMOVED***
