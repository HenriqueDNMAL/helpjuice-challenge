class ArticlesController < ApplicationController
  def search
    if params.dig(:search, :query).present?
      query = params.dig(:search, :query)
      # Updated to include ordering
      @articles = Article.where("title LIKE ?", "#{query}%").order(:title)
    else
      @articles = []
    end

    respond_to do |format|
      format.html
      format.json { render json: @articles.map(&:title) } # Assuming you want to return just the titles
    end
  end
end
