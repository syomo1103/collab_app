class RemoveDateStringFromObservations < ActiveRecord::Migration
  def change
    remove_column :observations, :date, :string
  end
end
