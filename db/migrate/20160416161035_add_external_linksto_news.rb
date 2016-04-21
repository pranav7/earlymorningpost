class AddExternalLinkstoNews < ActiveRecord::Migration
  def change
    add_column :news, :external, :boolean, default: :false
    add_column :news, :link, :string
    add_column :news, :source, :string
  end
end
