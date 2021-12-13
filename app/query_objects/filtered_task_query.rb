# frozen_string_literal: true

class FilteredTasksQuery < BaseFIlteredQuery
  Allowed_params = %i[status title].freeze

  def by_status(relation, status)
    relation.where(status: status)
  end

  def by_title(relation, title)
    relation.where(title: title)
  end
end
