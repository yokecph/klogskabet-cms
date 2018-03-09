class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name, unique: true
      t.string :title_da
      t.string :title_en
      t.string :subtitle_da
      t.string :subtitle_en
      t.string :result_title_da
      t.string :result_title_en

      t.timestamps
    end
  end
end
