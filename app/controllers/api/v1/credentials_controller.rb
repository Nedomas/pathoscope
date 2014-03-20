class Api::V1::CredentialsController < ApplicationController
  doorkeeper_for :all
  respond_to     :json

***REMOVED*** GET /me.json
  def me
    respond_with current_resource_owner
***REMOVED***

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
***REMOVED***
***REMOVED***
