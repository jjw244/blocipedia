class AddSlugToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :slug, :string
  end
  add_index :wikis, :slug, :unique => true
end
