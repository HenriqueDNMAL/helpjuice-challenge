require 'rails_helper'

RSpec.describe Admin::DashboardController, type: :controller do
  describe "GET #index" do
    before do
      # Setup data for @most_frequent_searches
      3.times { SearchAnalytic.create!(query: 'popular query', ip: '123.456.789.0', recorded_at: Time.now) }
      2.times { SearchAnalytic.create!(query: 'less popular query', ip: '123.456.789.1', recorded_at: Time.now) }

      # Setup data for @searches_over_time
      SearchAnalytic.create!(query: 'Search 1', ip: '123.456.789.0', recorded_at: 1.day.ago)
      SearchAnalytic.create!(query: 'Search 2', ip: '123.456.789.1', recorded_at: 1.day.ago)
      SearchAnalytic.create!(query: 'Search 3', ip: '123.456.789.2', recorded_at: Time.now)

      # Setup data for @recent_searches
      SearchAnalytic.create!(query: 'older query', ip: '123.456.789.0', recorded_at: 2.days.ago)
      SearchAnalytic.create!(query: 'recent query', ip: '123.456.789.1', recorded_at: Time.now)
    end

    it "assigns analytics data to instance variables" do
      get :index
      expect(assigns(:search_counts_by_ip)).to be_present
      expect(assigns(:most_frequent_searches)).to be_present
      expect(assigns(:searches_over_time)).to be_present
      expect(assigns(:recent_searches)).to be_present
    end

    it "responds with a 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "assigns the correct data to @most_frequent_searches" do
      get :index
      expect(assigns(:most_frequent_searches)).to be_present
      # Further assertions can be made about the content of @most_frequent_searches
    end

    it "assigns the correct data to @searches_over_time" do
      get :index
      expect(assigns(:searches_over_time)).to be_present
      # Further assertions can be made about the content of @searches_over_time
    end

    it "assigns the correct data to @recent_searches" do
      get :index
      expect(assigns(:recent_searches)).to be_present
      expect(assigns(:recent_searches).first.query).to eq('recent query')
      # Further assertions can be made about the order or number of @recent_searches
    end

    it "includes recent searches in @recent_searches" do
      # Setup test data
      SearchAnalytic.create!(query: 'Example Search', ip: '123.456.789.0', recorded_at: Time.now)

      get :index
      expect(assigns(:recent_searches)).not_to be_empty
      expect(assigns(:recent_searches).first.query).to eq('Example Search')
    end
  end
end
