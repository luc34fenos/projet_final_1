class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.integer :nombre
      t.decimal :price
      t.belongs_to :category, index: true
      t.belongs_to :panier, optional: true
    end
  end
end
