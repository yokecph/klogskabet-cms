json.theme_color quiz.theme.try(:color)
json.kind 'quiz'
json.bilingual quiz.bilingual?
json.extract! quiz, :id, :name, :title_da, :title_en, :subtitle_da, :subtitle_en, :result_title_da, :result_title_en, :created_at, :updated_at
json.options quiz.quiz_options, partial: 'quiz_options/quiz_option', as: :quiz_option
