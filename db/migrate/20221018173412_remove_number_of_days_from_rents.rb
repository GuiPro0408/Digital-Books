class RemoveNumberOfDaysFromRents < ActiveRecord::Migration[7.0]
  def change
    remove_column :rents, :number_of_days, :integer
  end
end
