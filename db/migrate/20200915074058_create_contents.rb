class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :contentable, polymorphic: true, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
