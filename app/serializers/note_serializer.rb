class NoteSerializer < ActiveModel::Serializer
  attributes *Note.column_names.map(&:to_sym)
***REMOVED***
