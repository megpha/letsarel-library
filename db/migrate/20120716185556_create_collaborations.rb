class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.references :book, null: false
      t.references :author, null: false
      t.string :role, null: false

      t.timestamps
    end
    add_index :collaborations, :book_id
    add_index :collaborations, :author_id
  end
end
