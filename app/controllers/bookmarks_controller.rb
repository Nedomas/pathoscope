class BookmarksController < ApplicationController
  def begin
    # resp = {}

    # if user_signed_in?
    #   resp[:logged_in] = true

    #   paths = current_user.paths.map do |path|
    #     { id: path.id, title: path.title, color: path.color, count: path.nodes.count }
    #   end

    #   resp[:paths] = paths.to_json
    # else
    #   resp[:logged_in] = false
    # end

    render json: {
      logged_in: user_signed_in?
    }
  end

  def redirect_explore
    redirect_to '/beta#/explore'
  end

  def data
    links = Array(Link.all).join_with_extra_fields
    paths = Array(Path.all).join_with_extra_fields

    user_path_item_ids = current_user.paths.map(&:item_id)
    links = Array(Link.all).join_with_extra_fields
    paths = Array(Path.all).join_with_extra_fields

    items = Item.all.each_with_object({}) do |item, obj|
      item_paths = item.context.paths.map(&:id).sort rescue []

      obj[item.id] = item.attributes.merge(
        title: item.context.title,
        paths: item_paths
      )
    end

    render json: {
      user_path_item_ids: user_path_item_ids,
      links: links,
      paths: paths,
      items: items
    }
  end

  def tag
    # User logged in
    item = Item.find(params[:item_id])
    path = item.context
    url = params[:href]
    node = Node.build(url, path, current_user)
    render json: { node_id: node.id }
  end

  def links
    node = Node.find(params[:node_id])
    link = { title: node.link.title, show_url: node.link.show_url }
    tag = { title: node.path.title, color: node.path.color }

    links = Explore.children_links(node.link).map do |link|
      {
        title: link.title,
        show_url: link.show_url,
        url: link.url,
        thumbnail_path: link.external_thumbnail_path,
        count: link.nodes.count
      }
    end

    render json: { link: link, tag: tag, links: links }
  end

  # def create
  #   query = URI::parse(params[:bookmarklet]).query
  #   data = Rack::Utils.parse_nested_query(query)
  #   path = Path.find(1) # TODO
  #   url = params[:href]
  #   node = Node.build(url, path, current_user)
  #   render json: true

  #   # # check if its from our app
  #   # if request.host == URI(url).host
  #   #   redirect_to paths_path(path) and return
  #   # end

  #   # result = {}

  #   # if user_signed_in?
  #   #   node = Node.build(url, path, current_user)
  #   #   result[:logged_in] = true

  #   #   paths = Explore.children_links(node.link).map do |link|
  #   #     { title: link.title, url: link.url, count: link.nodes.count }
  #   #   end

  #   #   result[:paths] = paths.to_json
  #   # else
  #   #   result[:logged_in] = false
  #   # end

  # end

  def templates
    render layout: false
  end

end
