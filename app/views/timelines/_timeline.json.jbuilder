json.theme_color timeline.theme.try(:color)
json.kind 'timeline'
json.bilingual timeline.bilingual?
json.extract! timeline, :id, :name, :title_da, :title_en, :created_at, :updated_at
json.intervals timeline.intervals, partial: 'intervals/interval', as: :interval
