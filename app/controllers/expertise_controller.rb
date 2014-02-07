class ExpertiseController < ApplicationController
  before_action :get_full_path

  def start
    @node = if node_id = params[:node_id]
      Node.find(node_id)
    else
      @full_path.middle
***REMOVED***

    edge = @full_path.index(@node)

    @above = @full_path[edge..-1].middle
    @below = @full_path[0..edge].middle

  ***REMOVED*** its done
    if [@above, @below].include?(@node)
      Node.build(@node.link.url, @path, current_user)
      flash[:notice] = "You have been successfully placed in #{@path.title}"
      redirect_to install_path
***REMOVED***

    @link = @node.link
***REMOVED***
#
#   def continue
#     node = Node.find(params[:node_id])
#     edge = @full_path.index(node)
# ***REMOVED***

***REMOVED*** def finish
***REMOVED***   @node = Node.find(params[:node_id])
***REMOVED***   binding.pry
***REMOVED*** ***REMOVED*** show first resource
***REMOVED*** ***REMOVED***

  private

  def get_full_path
    @path = Path.find(params[:path_id])
    max_depth = Node.where(path: @path).order('ancestry_depth DESC').limit(1)
      .pluck(:ancestry_depth).first
    deepest_node = Node.find_by(path: @path, ancestry_depth: max_depth)

    @full_path = Node.sort_by_ancestry(deepest_node.ancestors)
    @full_path << deepest_node
***REMOVED***
***REMOVED***

class Array
  def middle
    self[count/2]
***REMOVED***
***REMOVED***
