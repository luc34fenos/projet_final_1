class AddNombreToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :nombre, :integer
  end
end
