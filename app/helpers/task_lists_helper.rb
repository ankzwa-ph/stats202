module TaskListsHelper
  def get_parent(id)
    url = Settings.backlog.base_url + Settings.backlog.api.issue + '?apiKey=%s'
    HTTParty.get(url % [id, ENV['BACKLOG_API_KEY']])
  end
end
