class CommentsController < ApplicationController
  before_action :authenticate_user!, :except => :index

  def index
    comments = commentable(params).comments

    comment_data = []

    comments.each do |comment|
      obj = {
        name: comment.user.username,
        content: comment.content,
        time: comment.created_at
      }

      comment_data << obj
***REMOVED***

    r***REMOVED***er json: { comments: comment_data, logged_in: user_signed_in? }
***REMOVED***

  def create
    commentable(params).comments.create(content: params[:content], user_id: current_user.id)

    r***REMOVED***er json: true
***REMOVED***

  private

  def commentable(params)
    location = (params[:location].split('/') - ['', nil])
    location_name = location.first
    location_id = location.second

    model = case location_name
    when 'explore'
      Link
    else
      Path
***REMOVED***

    model.find(location_id)
***REMOVED***
***REMOVED***
