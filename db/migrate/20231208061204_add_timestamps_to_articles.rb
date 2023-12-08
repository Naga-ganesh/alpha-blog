class AddTimestampsToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :created_at, :datetime
    add_column :articles, :uploaded_at, :datetime
  end
end
