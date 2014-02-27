class AddSubHeadingToNews < ActiveRecord::Migration
  def change
    add_column :news, :sub_heading, :text
  end
end
