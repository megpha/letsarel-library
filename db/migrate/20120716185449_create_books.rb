class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :language, null: false
      t.string :genre, null: false
      t.references :publisher, null: false
      t.boolean :published, null: false, default: false

      t.timestamps
    end
    add_index :books, :publisher_id
  end
end
