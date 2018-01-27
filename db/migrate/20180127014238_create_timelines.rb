class CreateTimelines < ActiveRecord::Migration[5.1]
  def change
    create_table :timelines do |t|
      t.string :name, unique: true
      t.string :title_da
      t.string :title_en

      t.timestamps
    end
  end
end
