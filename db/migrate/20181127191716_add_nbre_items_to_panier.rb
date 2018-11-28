class AddNbreItemsToPanier < ActiveRecord::Migration[5.2]
  def change
    add_column :paniers, :nbre_items, :integer
  end
end
