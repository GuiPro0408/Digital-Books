class AddBookContentToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :book_content, :text, array: true, default: []
  end
end
