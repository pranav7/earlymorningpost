class AddLikesToNews < ActiveRecord::Migration
  def change
    add_column :news, :likes, :integer, null: :false, default: 0
  end
end
