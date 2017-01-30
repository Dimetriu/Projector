json.extract! task, :id, :content, :date, :priority, :done, :created_at, :updated_at
json.url task_url(task, format: :json)