class Explore
  class << self
    def links(nodes)
      nodes.map(&:link)
    end

    def node_urls(nodes)
      links(nodes).map(&:url)
    end

    def children_items(item)
      item.nodes.map(&:children).flatten.map(&:item)
    end

    def children_links_for_user(link, user)
      link.nodes.where(user: user).map(&:children).flatten.map(&:link)
      link.nodes.map(&:children).flatten.map(&:link)
    end

    def root_links(path)
      links(path.roots).uniq
    end

    def root_links_for_user(path, user)
      links(path.roots_for_user(user)).uniq
    end

    def links_for_user(path, user)
      Node.sort_by_ancestry(Node.where(path: path, user: user)).map(&:link)
    end
  end
end
