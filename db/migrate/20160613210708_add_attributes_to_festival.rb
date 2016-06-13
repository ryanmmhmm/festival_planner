class AddAttributesToFestival < ActiveRecord::Migration[5.0]
  def change
    add_column :festivals, :title, :string
    add_column :festivals, :start_time, :time
    add_column :festivals, :end_time, :time
  end
end
