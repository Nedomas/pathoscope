class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:alert] = 'Public registrations are not open yet'
    redirect_to root_path
***REMOVED***

  def create
    flash[:alert] = 'Public registrations are not open yet'
    redirect_to root_path
***REMOVED***
***REMOVED***
