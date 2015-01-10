require 'rails_helper'

RSpec.describe "task_stats/show", :type => :view do
  before(:each) do
    @task_stat = assign(:task_stat, TaskStat.create!(
      :open => 1,
      :in_progress => 2,
      :resolved => 3,
      :closed => 4,
      :total => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
