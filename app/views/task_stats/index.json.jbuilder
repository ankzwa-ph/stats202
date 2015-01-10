json.array!(@task_stats) do |task_stat|
  json.extract! task_stat, :id, :open, :in_progress, :resolved, :closed, :total, :processing_date
  json.url task_stat_url(task_stat, format: :json)
end
