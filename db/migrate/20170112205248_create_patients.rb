class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :diagnosis
      t.string :parent
      t.string :parent_email
      t.integer :age
      t.string :gender
      t.string :home_session
      t.string :school_session
      t.attachment :image

      t.timestamps null: false
    end
  end
end
