class Array
  def deep_compact
    term = []
    hash = each_with_object({}) do |obj,res|
      if obj.is_a?(Hash)
        obj.each do |key,val|
          res[key] ||= []
          res[key] += val.respond_to?(:deep_compact) ? val.deep_compact : val
        end
      else
        term << obj
      end
    end
    hash.map {|it| Hash[*it] } + term
  end

  def join_with_extra_fields
    each_with_object({}) do |element, result|
      extra_fields = element.class::EXTRA_FIELDS.each_with_object({}) do |field, obj|
        obj[field] = element.send(field)
      end

      result[element.id] = element.attributes.merge(extra_fields)
    end
  end
end
