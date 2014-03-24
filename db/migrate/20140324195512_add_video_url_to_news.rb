class AddVideoUrlToNews < ActiveRecord::Migration
  def change
    add_column :news, :video_url, :string
  end
end
