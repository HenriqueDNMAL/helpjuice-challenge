class CreateSearchAnalytics < ActiveRecord::Migration[7.1]
  def change
    create_table :search_analytics do |t|
      t.string :ip
      t.string :query
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
