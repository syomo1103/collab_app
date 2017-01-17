class RemoveStudentFromObservations < ActiveRecord::Migration
  def change
    remove_column :observations, :student, :string
  end
end
