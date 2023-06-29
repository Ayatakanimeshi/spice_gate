class SorceryCore < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt
      t.string :name, null: false
      t.integer :age, null: false
      t.string :live_prefecture, null: false
      t.string :profile_img
      t.integer :tolerance, null: false

      t.timestamps                null: false
    end
    
  end
end
