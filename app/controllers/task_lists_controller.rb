class TaskListsController < ApplicationController
  def index
    uri = Settings.backlog.base_url + Settings.backlog.api.issues + '?apiKey=%s&projectId[]=1073827573&assigneeId[]=%s&statusId[]=1&statusId[]=2'
    @tasks = Member.all.map(&:backlog_id).map { |id| HTTParty.get(uri % [ENV['BACKLOG_API_KEY'], id]) }
  end
end
