require "rails_helper"

RSpec.describe TaskStatsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_stats").to route_to("task_stats#index")
    end

    it "routes to #new" do
      expect(:get => "/task_stats/new").to route_to("task_stats#new")
    end

    it "routes to #show" do
      expect(:get => "/task_stats/1").to route_to("task_stats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_stats/1/edit").to route_to("task_stats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_stats").to route_to("task_stats#create")
    end

    it "routes to #update" do
      expect(:put => "/task_stats/1").to route_to("task_stats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_stats/1").to route_to("task_stats#destroy", :id => "1")
    end

  end
end
