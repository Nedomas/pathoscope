class ExploreController < ApplicationController
  before_action :authenticate_user!

  def large_index
    data = {}
    center = Link.find(params[:link_id])
    minus_one = center.nodes.map(&:parent).reject(&:nil?).map(&:link).uniq

    minus_one.each do |link|
      minus_three = link.nodes.map(&:parent).reject(&:nil?).map(&:link)

      minus_three.each do |minus_three_link|
        data[minus_three_link.id] ||= {}

        Explore.children_links(minus_three_link).each do |minus_two_link|
          data[minus_three_link.id][minus_two_link.id] ||= {}

          Explore.children_links(minus_two_link).each do |minus_one_link|
            data[minus_three_link.id][minus_two_link.id][minus_one_link.id] ||= {}

            Explore.children_links(minus_one_link).each do |zero_link|
              data[minus_three_link.id][minus_two_link.id][minus_one_link.id][
                zero_link.id] ||= {}

              Explore.children_links(zero_link).each do |plus_one_link|
                data[minus_three_link.id][minus_two_link.id][minus_one_link.id][
                  zero_link.id][plus_one_link.id] ||= {}

                Explore.children_links(plus_one_link).each do |plus_two_link|
                  data[minus_three_link.id][minus_two_link.id][minus_one_link.id][
                    zero_link.id][plus_one_link.id][plus_two_link.id] ||= {}

                  Explore.children_links(plus_two_link).each do |plus_three_link|
                    data[minus_three_link.id][minus_two_link.id][minus_one_link.id][
                      zero_link.id][plus_one_link.id][plus_two_link.id][plus_three_link.id] ||= {}
              ***REMOVED***
            ***REMOVED***
          ***REMOVED***
        ***REMOVED***
      ***REMOVED***
    ***REMOVED***
  ***REMOVED***
***REMOVED***

    r***REMOVED***er json: {
      structure: data,
      links: Link.all.index_by(&:id)
    }
***REMOVED***

  def itemize(obj)
    obj.each_with_object([]) { |(k,v), obj| obj << { k.item.id => itemize(v) } }
***REMOVED***

  def compactize(x)
    result = {}

    case x
    when Array
      if x.first.is_a?(Hash)
        result[x] = x.each_with_object({}) do |(key, values), obj|
          obj[key] ||= []
          obj[key] << values
    ***REMOVED***
      else
        result[x.first] ||= compactize(x.last)
  ***REMOVED***
    when Hash
      result[x.first] ||= compactize(x.last)
***REMOVED***
  ***REMOVED*** binding.pry
  ***REMOVED*** obj.each_with_object([]) do |(k,v), obj|
  ***REMOVED***   if k
  ***REMOVED***     obj << compactize(k)
  ***REMOVED***   else
  ***REMOVED***     compactize(v)
  ***REMOVED*** ***REMOVED***
  ***REMOVED***   binding.pry
  ***REMOVED*** ***REMOVED***
***REMOVED***

  def index
    structure = {}
    structure = compactize(itemize(Node.arrange))
    center = Item.find(params[:item_id])
  ***REMOVED*** depths = center.nodes.map(&:ancestry_depth)
  ***REMOVED*** # depths_range = (depths.min-1)..(depths.max+1)
  ***REMOVED*** start_nodes = Node.at_depth(depths.min-1)
  ***REMOVED*** start_nodes = Node.at_depth(depths.min) if start_nodes.empty?

  ***REMOVED*** start_nodes.each do |node|
  ***REMOVED***   structure[node] = node.children
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** binding.pry


  ***REMOVED*** # minus_one = center.nodes.map(&:parent).reject(&:nil?).map(&:item).map(&:context).uniq
  ***REMOVED*** minus_one = center.nodes.map(&:parent).map(&:item)
  ***REMOVED*** # binding.pry
  ***REMOVED*** # binding.pry

  ***REMOVED*** minus_one.each do |minus_one_item|
  ***REMOVED***   structure[minus_one_item.id] ||= {}

  ***REMOVED***   Explore.children_items(minus_one_item).each do |zero_item|
  ***REMOVED***     structure[minus_one_item.id][zero_item.id] ||= {}

  ***REMOVED***     Explore.children_items(zero_item).each do |plus_one_item|
  ***REMOVED***       structure[minus_one_item.id][zero_item.id][plus_one_item.id] ||= {}
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** ***REMOVED***

    links = Link.all.each_with_object({}) do |link, obj|
      obj[link.id] = {
        id: link.id,
        title: link.show_title,
        show_url: link.show_url,
        url: link.url,
        paths: link.paths.map(&:id).sort
      }
***REMOVED***

    items = Item.all.each_with_object({}) do |item, obj|
      item_paths = item.context.paths.map(&:id).sort rescue []

      obj[item.id] = {
        id: item.id,
        title: item.context.title,
        show_url: item.context.andand.show_url,
        url: item.context.andand.url,
        paths: item_paths
      }
***REMOVED***


    r***REMOVED***er json: {
      structure: structure,
      links: links,
      items: items,
      paths: Path.all.index_by(&:id),
      center: center.id
    }
***REMOVED***

  def show
  ***REMOVED*** @current_link = Link.find(params[:id])
  ***REMOVED*** @forward_links = Explore.children_links(@current_link)
  ***REMOVED*** nodes = @current_link.nodes
  ***REMOVED*** parents = nodes.map(&:parent).compact

  ***REMOVED*** zero_depth_nodes = nodes.select { |node| node.ancestry_depth == 0 }
  ***REMOVED*** parent_paths = zero_depth_nodes.map(&:path).uniq

  ***REMOVED*** if parents.present?
  ***REMOVED***   @back_collection = parents.each_with_object({}) do |parent, obj|
  ***REMOVED***     obj[parent.path] = parent.link
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** else
  ***REMOVED***   paths = nodes.map(&:path).uniq
  ***REMOVED***   @back_collection = paths.each_with_object({}) do |path, obj|
  ***REMOVED***     obj[path] = paths_path(path)
  ***REMOVED*** ***REMOVED***
  ***REMOVED*** ***REMOVED***

  ***REMOVED*** parent_paths.each do |parent_path|
  ***REMOVED***   @back_collection[parent_path] = parent_path
  ***REMOVED*** ***REMOVED***
***REMOVED***
***REMOVED***
