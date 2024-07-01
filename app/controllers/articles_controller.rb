class ArticlesController < ApplicationController
  def search
    if params.dig(:search, :query).present?
      query = params.dig(:search, :query)
      @articles = Article.where("title LIKE ?", "#{query}%").order(:title)

      # Record the search only if the request is for HTML (i.e., form submission)
      if request.format.html?
        SearchAnalytic.create(ip: request.remote_ip, query: query, recorded_at: Time.current)
      end
    else
      @articles = []
    end

    respond_to do |format|
      format.html # For form submission
      format.json { render json: @articles.map(&:title) } # For suggestions
    end
  end
end
