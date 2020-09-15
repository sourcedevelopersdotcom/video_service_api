class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :title
      t.string :plot
      t.integer :number
      t.references :season, null: false, foreign_key: true

      t.timestamps
    end

    add_index :episodes, %i[season_id number], unique: true
    add_index :episodes, %i[season_id title], unique: true
  end
end
