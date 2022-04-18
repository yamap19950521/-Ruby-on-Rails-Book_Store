class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :date
      t.integer :price
      t.integer :pages
      t.integer :ISBN

      t.timestamps
    end
  end
end
