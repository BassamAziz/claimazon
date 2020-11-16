class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :author
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :image
      t.monetize :price
      t.integer :items_in_stock
      t.integer :rating
      t.timestamps
    end
  end
end
