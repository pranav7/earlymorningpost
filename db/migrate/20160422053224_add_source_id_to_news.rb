class AddSourceIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :source_id, :integer, unique: true, index: true
  end
end
