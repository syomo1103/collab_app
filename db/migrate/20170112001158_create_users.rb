class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :location
      t.string :sector
      t.string :email
      t.string :password_digest
      t.attachment :image

      t.timestamps null: false
    end
  end
end
