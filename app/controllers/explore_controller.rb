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

  def index
    structure = {}
    center = Link.find(params[:link_id])
    minus_one = center.nodes.map(&:parent).reject(&:nil?).map(&:link).uniq

    minus_one.each do |minus_one_link|
      structure[minus_one_link.id] ||= {}

      Explore.children_links(minus_one_link).each do |zero_link|
        structure[minus_one_link.id][zero_link.id] ||= {}

        Explore.children_links(zero_link).each do |plus_one_link|
          structure[minus_one_link.id][zero_link.id][plus_one_link.id] ||= {}
    ***REMOVED***
  ***REMOVED***
***REMOVED***

    links = Link.all.each_with_object({}) do |link, obj|
      obj[link.id] = {
        id: link.id,
        title: link.show_title,
        show_url: link.show_url,
        url: link.url,
        paths: link.paths.map(&:id).sort
      }
***REMOVED***

    r***REMOVED***er json: {
      structure: structure,
      links: links,
      paths: Path.all.index_by(&:id),
      center: center.id
    }
***REMOVED***

  def show
    @current_link = Link.find(params[:id])
    @forward_links = Explore.children_links(@current_link)
    nodes = @current_link.nodes
    parents = nodes.map(&:parent).compact

    zero_depth_nodes = nodes.select { |node| node.ancestry_depth == 0 }
    parent_paths = zero_depth_nodes.map(&:path).uniq

    if parents.present?
      @back_collection = parents.each_with_object({}) do |parent, obj|
        obj[parent.path] = parent.link
  ***REMOVED***
    else
      paths = nodes.map(&:path).uniq
      @back_collection = paths.each_with_object({}) do |path, obj|
        obj[path] = paths_path(path)
  ***REMOVED***
***REMOVED***

    parent_paths.each do |parent_path|
      @back_collection[parent_path] = parent_path
***REMOVED***
***REMOVED***
***REMOVED***
