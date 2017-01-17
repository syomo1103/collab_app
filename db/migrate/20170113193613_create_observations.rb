class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :student
      t.string :date
      t.string :activity
      t.string :target_program
      t.boolean :prompt
      t.string :behaviors
      t.text :session_notes
      t.references :patient, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.index [:patient_id, :user_id]

      t.timestamps null: false
    end
  end
end
