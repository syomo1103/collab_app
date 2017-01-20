class AddDateToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :date, :date
  end
end
