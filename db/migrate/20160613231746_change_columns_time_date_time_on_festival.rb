class ChangeColumnsTimeDateTimeOnFestival < ActiveRecord::Migration[5.0]
  def up
    remove_column :festivals, :start_time, :time
    remove_column :festivals, :end_time, :time

    add_column :festivals, :start_time, :timestamptz
    add_column :festivals, :end_time, :timestamptz
  end

  def down
    remove_column :festivals, :start_time, :timestamptz
    remove_column :festivals, :end_time, :timestamptz

    change_column :festivals, :start_time, :time
    change_column :festivals, :end_time, :time
  end
end
