class Explore
  class << self
    def links(nodes)
      nodes.map(&:link)
***REMOVED***

    def node_urls(nodes)
      links(nodes).map(&:url)
***REMOVED***

    def children_links(link)
      link.nodes.map(&:children).flatten.map(&:link)
***REMOVED***

    def root_links(path)
      links(path.roots).uniq
***REMOVED***
***REMOVED***
***REMOVED***
