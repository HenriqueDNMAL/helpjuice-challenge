class SearchAnalytic < ApplicationRecord
  validates :ip, presence: true
  validates :query, presence: true
  validates :recorded_at, presence: true
end
