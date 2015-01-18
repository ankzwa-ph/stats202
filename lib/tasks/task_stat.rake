namespace :task_stat do
  desc 'Counts tasks for each status[open|in progress|resolved|closed]'

  task count: :environment do
    uri = Settings.basklog.base_url + Settings.backlog.api.count + '?apiKey=%s&projectId[]=1073827573&statusId[]=%s'
    stats = TaskStat.new(processing_date: Date.today)
    TaskStatus.all.each do |task|
      stats[task.name] = HTTParty.get(uri % [ENV['BACKLOG_API_KEY'], task.id])['count']
    end
    stats[:total] = TaskStatus.all.map(&:name).inject(0) { |m,n| m + stats[n] }
    stats.save
  end
end
