class Search::TaskStat < Search::Base
  attr_accessor :date_from

  def initialize(attributes = {})
    super attributes if attributes.present?
  end

  def matches
    t = ::TaskStat.arel_table
    results = TaskStat.all
    results = results.where(t[:processing_date].gteq("#{date_from}")) if date_from.present?
    results
  end
end
