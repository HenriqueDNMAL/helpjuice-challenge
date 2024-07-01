class Admin::DashboardController < ApplicationController
  def index
    @search_counts_by_ip = SearchAnalytic.group(:ip).count
    @most_frequent_searches = SearchAnalytic.group(:query).order('count_query DESC').count(:query)
    @searches_over_time = SearchAnalytic.group_by_day(:recorded_at).count
    @recent_searches = SearchAnalytic.order(recorded_at: :desc).limit(10)
  end
end
