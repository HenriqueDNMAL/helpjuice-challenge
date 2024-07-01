require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'is valid with valid attributes' do
    article = Article.new(title: 'How to Grow Carrots', content: 'This is a guide on growing carrots.')
    expect(article).to be_valid
  end

  it 'is not valid without a title' do
    article = Article.new(content: 'This is a guide on growing carrots.')
    expect(article).not_to be_valid
  end

  it 'is not valid without content' do
    article = Article.new(title: 'How to Grow Carrots')
    expect(article).not_to be_valid
  end
end
