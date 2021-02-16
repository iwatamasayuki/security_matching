class CreateGuards < ActiveRecord::Migration[6.0]
  def change
    create_table :guards do |t|
      t.string  :company
      t.string  :guard_name,    null: false
      t.string  :name_kana,     null: false
      t.string  :gender,        null: false
      t.integer :age,           null: false
      t.integer :experience,    null: false
      t.integer :qualification, null: false
      t.references :user,            foreign_key: true
      t.timestamps
    end
  end
end
