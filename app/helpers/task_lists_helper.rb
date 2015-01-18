module TaskListsHelper
  def get_parent_issue(task)
    url = Settings.backlog.base_url + Settings.backlog.api.issue + '?apiKey=%s'
    HTTParty.get(url % [task['parentIssueId'], ENV['BACKLOG_API_KEY']])
  end
end
