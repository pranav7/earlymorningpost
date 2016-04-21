class AddActivetoNews < ActiveRecord::Migration
  def change
    add_column :news, :active, :boolean, default: true
  end
end
