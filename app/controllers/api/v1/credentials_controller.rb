class Api::V1::CredentialsController < ApplicationController
  doorkeeper_for :all
  respond_to     :json

  # GET /me.json
  def me
    respond_with current_resource_owner
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
