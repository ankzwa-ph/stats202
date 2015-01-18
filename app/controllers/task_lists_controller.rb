class TaskListsController < ApplicationController
  include BacklogApiAccessible

  def index
    params = { 'statusId[]' => 1, 'statusId[]' => 2 }
    @tasks = Member.all.map(&:backlog_id).map do |id|
      fetch(Settings.backlog.api.issues, params.merge({'assigneeId[]' => id}))
    end
  end
end
