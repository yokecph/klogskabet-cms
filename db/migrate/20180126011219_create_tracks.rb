class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.references :playlist, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
