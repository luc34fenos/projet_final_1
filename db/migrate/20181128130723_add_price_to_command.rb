class AddPriceToCommand < ActiveRecord::Migration[5.2]
  def change
    add_column :commands, :price, :decimal
  end
end
