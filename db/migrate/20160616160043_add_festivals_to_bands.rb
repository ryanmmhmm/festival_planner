class AddFestivalsToBands < ActiveRecord::Migration[5.0]
  def up
    add_column :bands, :festival_id, :integer
    add_foreign_key :bands, :festivals
  end

  def down
    remove_column :bands, :festival_id, :integer
    remove_foreign_key :bands, :festivals
  end
end
