class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :overview
      t.string :author
      t.string :category
      t.text :content
      t.string :poster_url
      t.integer :price_per_day

      t.timestamps
    end
  end
end
