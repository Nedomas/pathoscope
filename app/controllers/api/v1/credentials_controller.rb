class Api::V1::CredentialsController < ApplicationController
  doorkeeper_for :all
  respond_to     :json

***REMOVED*** GET /me.json
  def me
    respond_with current_user
***REMOVED***
***REMOVED***
