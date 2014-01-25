class LaunchingController < ApplicationController
  def index
    r***REMOVED***er layout: 'launching'
***REMOVED***

  def get
    invitation = Invitation.new(email: params[:email])

    if invitation.save
      flash[:notice] = "You have joined our invite list"
    else
      flash[:alert] = invitation.errors.full_messages.first
***REMOVED***

    redirect_to root_url
***REMOVED***
***REMOVED***
