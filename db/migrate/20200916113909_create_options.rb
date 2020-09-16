class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.float :price
      t.integer :quality
      t.references :content, null: false, foreign_key: true

      t.timestamps
    end

    add_index :options, %i[content_id quality], unique: true
  end
end
