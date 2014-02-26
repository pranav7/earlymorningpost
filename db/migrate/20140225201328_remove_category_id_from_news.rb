class RemoveCategoryIdFromNews < ActiveRecord::Migration
  def change
  	remove_column :news, :category_id
  end
end
