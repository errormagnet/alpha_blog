# Add user_id FK to articles table
class UserIdInArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :int
  end
end
