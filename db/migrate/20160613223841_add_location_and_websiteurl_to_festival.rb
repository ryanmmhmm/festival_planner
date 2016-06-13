class AddLocationAndWebsiteurlToFestival < ActiveRecord::Migration[5.0]
  def change
    add_column :festivals, :location, :string
    add_column :festivals, :website_url, :string
  end
end
