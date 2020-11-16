class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.integer :degree
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
