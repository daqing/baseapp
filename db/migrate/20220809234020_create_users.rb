class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, default: ""
      t.string :phone, default: ""
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
