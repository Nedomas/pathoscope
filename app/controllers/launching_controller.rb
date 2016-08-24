class LaunchingController < ApplicationController
  def index
    render layout: 'launching'
  end

  def get
    invitation = Invitation.new(email: params[:email])

    if invitation.save
      flash[:notice] = "You have joined our invite list"
    else
      flash[:alert] = invitation.errors.full_messages.first
    end

    redirect_to root_url
  end
end
