class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
    	t.integer :nbre_items
    	t.belongs_to :panier, index: true
		t.belongs_to :post, index: true
    end
  end
end
