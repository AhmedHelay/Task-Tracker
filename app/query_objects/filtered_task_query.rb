class FilteredTasksQuery < BaseFIlteredQuery
    Allowed_params = [:status, :title]

    def by_status(relation, status)
        relation.where(:status => status)
    end

    def by_title(relation, title)
        relation.where(:title => title)
    end
end