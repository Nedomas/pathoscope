class Explore
  class << self
    def links(nodes)
      nodes.map(&:link)
***REMOVED***

    def node_urls(nodes)
      links(nodes).map(&:url)
***REMOVED***

    def children_items(item)
      item.nodes.map(&:children).flatten.map(&:item)
***REMOVED***

    def children_links_for_user(link, user)
      link.nodes.where(user: user).map(&:children).flatten.map(&:link)
      link.nodes.map(&:children).flatten.map(&:link)
***REMOVED***

    def root_links(path)
      links(path.roots).uniq
***REMOVED***

    def root_links_for_user(path, user)
      links(path.roots_for_user(user)).uniq
***REMOVED***

    def links_for_user(path, user)
      Node.sort_by_ancestry(Node.where(path: path, user: user)).map(&:link)
***REMOVED***
***REMOVED***
***REMOVED***
