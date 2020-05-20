class AddColumnIsValidToGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :is_valid, :boolean, default: true
  end
end
