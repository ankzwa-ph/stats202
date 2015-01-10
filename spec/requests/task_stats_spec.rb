require 'rails_helper'

RSpec.describe "TaskStats", :type => :request do
  describe "GET /task_stats" do
    it "works! (now write some real specs)" do
      get task_stats_path
      expect(response.status).to be(200)
    end
  end
end
