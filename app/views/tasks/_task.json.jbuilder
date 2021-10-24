json.extract! task, :id, :project_id, :title, :description, :deadline_at, :created_at, :updated_at
json.url task_url(task, format: :json)
