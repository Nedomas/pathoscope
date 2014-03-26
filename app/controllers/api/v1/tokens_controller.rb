class Api::V1::TokensController < Doorkeeper::TokensController
  def create
    response = strategy.authorize
    self.headers.merge! response.headers

    if response.respond_to?(:token)
      self.response_body = response.body.merge!(user_id: response.token.resource_owner_id).to_json
    else
      self.response_body = response.body.to_json
***REMOVED***

    self.status        = response.status
***REMOVED***
***REMOVED***
