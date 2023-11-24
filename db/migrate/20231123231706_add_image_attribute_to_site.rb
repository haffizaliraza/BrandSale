class AddImageAttributeToSite < ActiveRecord::Migration[7.0]
  def change
    add_column :sites, :image_attribute, :string
  end
end
