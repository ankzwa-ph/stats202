class TaskStat < ActiveRecord::Base

  def self.transpose_table(table)
    matrix = table.map do |e|
      date = e.processing_date
      str = ([1,15].include? date.day) ? "%m-%d" : "%d"
      [date.strftime(str), e.open, e.in_progress, e.resolved, e.closed, e.total]
    end
    matrix = matrix.transpose
    statuses = [''] + TaskStatus.all.map(&:name)
    matrix.map { |m| [statuses.shift] + m }
  end
end
