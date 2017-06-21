

class Film < ApplicationRecord
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
      when /^created_at_/
        # Simple sort on the created_at column.
        # Make sure to include the table name to avoid ambiguous column names.
        # Joining on other tables is quite common in Filterrific, and almost
        # every ActiveRecord table has a 'created_at' column.
        order("films.created_at #{ direction }")
      when /^name_/
        # Simple sort on the name colums
        order("films.name #{ direction }")
      when /^developer_/
        # This sorts by a student's country name, so we need to include
        # the country. We can't use JOIN since not all students might have
        # a country.
        order("films.developer #{ direction }")
      when /^iso_/
        # This sorts by a student's country name, so we need to include
        # the country. We can't use JOIN since not all students might have
        # a country.
        order("films.iso #{ direction }")
      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  filterrific(
      default_filter_params: { sorted_by: 'created_at_desc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_developer,
          :with_name,
          :with_ISO
      ]
  )
end
