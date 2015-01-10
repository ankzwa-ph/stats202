require 'rails_helper'

RSpec.describe "task_stats/index", :type => :view do
  before(:each) do
    assign(:task_stats, [
      TaskStat.create!(
        :open => 1,
        :in_progress => 2,
        :resolved => 3,
        :closed => 4,
        :total => 5
      ),
      TaskStat.create!(
        :open => 1,
        :in_progress => 2,
        :resolved => 3,
        :closed => 4,
        :total => 5
      )
    ])
  end

  it "renders a list of task_stats" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
