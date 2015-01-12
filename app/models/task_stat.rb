class TaskStat < ActiveRecord::Base

  def self.transpose_table(task_stats)
    table = []
    row_items = [:processing_date] + TaskStatus.all.map(&:name)
    row_items.each do |status|
      list = []
      task_stats.each do |item|
        if status == :processing_date
          list << item[status].strftime("%d")
        else
          list << item[status]
        end
      end
      table << list
    end
    row_items[0] = ''
    table.map { |x| [row_items.shift] + x }
  end
end
