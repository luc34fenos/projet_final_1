class CreatePaniers < ActiveRecord::Migration[5.2]
  def change
    create_table :paniers do |t|
      t.references :user, index: true

      t.timestamps
    end
  end
end
