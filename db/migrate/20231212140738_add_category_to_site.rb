class AddCategoryToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :category, :string
  end
end
