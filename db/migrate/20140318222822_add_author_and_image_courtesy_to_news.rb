class AddAuthorAndImageCourtesyToNews < ActiveRecord::Migration
  def change
    add_column :news, :author, :string
    add_column :news, :image_courtesy, :string
  end
end
