class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_days
      t.date :started_at
      t.date :end_at

      t.timestamps
    end
  end
end
