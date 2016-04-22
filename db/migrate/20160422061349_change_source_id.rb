class ChangeSourceId < ActiveRecord::Migration
  def change
    change_column :news, :source_id, :string
  end
end
