class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false, index: { unique: true }
      t.string :plot

      t.timestamps
    end
  end
end
