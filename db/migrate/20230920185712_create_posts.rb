class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.integer :shop_prefecture, null: false
      t.string :title, null: false
      t.integer :spiciness, null: false
      t.string :curry_img

      t.timestamps
    end
  end
end