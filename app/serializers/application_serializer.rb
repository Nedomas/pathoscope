class ApplicationSerializer < ActiveModel::Serializer
  embed :ids, include: true, root: true
end
