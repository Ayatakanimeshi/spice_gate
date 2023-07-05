class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.integer :prefecture, null: false
      t.string :business_hour
      t.string :closed
      t.string :shop_img
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
