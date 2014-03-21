class Api::V1::TokensController < Doorkeeper::TokensController
  def create
    response = strategy.authorize
    self.headers.merge! response.headers
    self.response_body = response.body.merge!(user_id: response.token.resource_owner_id).to_json
    self.status        = response.status
***REMOVED***
***REMOVED***
