class Array
  def deep_compact
    term = []
    hash = each_with_object({}) do |obj,res|
      if obj.is_a?(Hash)
        obj.each do |key,val|
          res[key] ||= []
          res[key] += val.respond_to?(:deep_compact) ? val.deep_compact : val
    ***REMOVED***
      else
        term << obj
  ***REMOVED***
***REMOVED***
    hash.map {|it| Hash[*it] } + term
***REMOVED***
***REMOVED***
