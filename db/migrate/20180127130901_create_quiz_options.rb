class CreateQuizOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :quiz_options do |t|
      t.references :quiz, foreign_key: true
      t.string :option_da
      t.string :option_en
      t.string :answer_da
      t.string :answer_en

      t.timestamps
    end
  end
end
