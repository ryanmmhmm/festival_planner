class CreateSkeletons < ActiveRecord::Migration[5.0]
  def change
    create_table :skeletons do |t|
      t.string :data
    end
  end
end
