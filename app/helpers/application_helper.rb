module ApplicationHelper
  def explore_link(resource, parameters = {})
    case resource
    when Path
      if params[:controller] == 'ego'
        ego_road_path(resource)
      else
        paths_path(resource)
      end
    when Link
      if params[:controller] == 'ego'
        ego_link_path(resource)
      else
        explore_path(resource)
      end
    when String
      resource
    end
  end

  def inline_svg(path)
    file = File.open("app/assets/images/#{path}", "rb")
    raw file.read
  end
end
