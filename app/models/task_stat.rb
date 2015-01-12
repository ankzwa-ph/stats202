class TaskStat < ActiveRecord::Base

  def self.transpose_table(table)
    matrix = table.map { |e| [e.open, e.in_progress, e.resolved, e.closed, e.total] }
    matrix = matrix.transpose
    statuses = [''] + TaskStatus.all.map(&:name)
    matrix.map { |m| [statuses.shift] + m }
  end
end
