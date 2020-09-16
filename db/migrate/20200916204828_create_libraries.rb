class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_view :libraries
  end
end
