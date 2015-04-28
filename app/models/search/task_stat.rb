class Search::TaskStat < Search::Base
  attr_accessor :date_from, :date_to

  def initialize(attributes = {})
    super attributes if attributes.present?
  end

  def matches
    t = ::TaskStat.arel_table
    results = TaskStat.all
    results = results.where(t[:processing_date].gteq(Date.today.prev_month)) if date_from.nil? && date_to.nil?
    results = results.where(t[:processing_date].gteq("#{date_from}")) if date_from.present?
    results = results.where(t[:processing_date].lteq("#{date_to}")) if date_to.present?
    results
  end
end
