class AddSourceNameToNews < ActiveRecord::Migration
  def change
    add_column :news, :source_name, :string
  end
end
