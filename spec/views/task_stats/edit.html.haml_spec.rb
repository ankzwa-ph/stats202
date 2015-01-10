require 'rails_helper'

RSpec.describe "task_stats/edit", :type => :view do
  before(:each) do
    @task_stat = assign(:task_stat, TaskStat.create!(
      :open => 1,
      :in_progress => 1,
      :resolved => 1,
      :closed => 1,
      :total => 1
    ))
  end

  it "renders the edit task_stat form" do
    render

    assert_select "form[action=?][method=?]", task_stat_path(@task_stat), "post" do

      assert_select "input#task_stat_open[name=?]", "task_stat[open]"

      assert_select "input#task_stat_in_progress[name=?]", "task_stat[in_progress]"

      assert_select "input#task_stat_resolved[name=?]", "task_stat[resolved]"

      assert_select "input#task_stat_closed[name=?]", "task_stat[closed]"

      assert_select "input#task_stat_total[name=?]", "task_stat[total]"
    end
  end
end
