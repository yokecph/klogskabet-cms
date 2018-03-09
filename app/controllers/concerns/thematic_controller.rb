module ThematicController
  extend ActiveSupport::Concern

  included do
    before_action :set_theme, only: [:index, :new, :create]
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end
end