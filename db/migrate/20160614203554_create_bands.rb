class CreateBands < ActiveRecord::Migration[5.0]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :description
      t.string :website_url
      t.string :soundcloud_url
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
