class UpdateColumntoTextNews < ActiveRecord::Migration
  def change
    change_column :news, :link, :text
  end
end
