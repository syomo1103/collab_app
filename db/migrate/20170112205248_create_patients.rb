class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :gender
      t.boolean :home_session
      t.boolean :school_session
      t.attachment :image

      t.timestamps null: false
    end
  end
end
