class QuizzesController < ApplicationController
  include ThematicController

  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  def index
    @quizzes = @theme.quizzes.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = @theme.quizzes.new
    @quiz.quiz_options = Quiz::OPTION_COUNT.times.map { @quiz.quiz_options.new }
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  def create
    @quiz = @theme.quizzes.new(quiz_params)

    if @quiz.save
      redirect_to @quiz, notice: 'Quiz was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'Quiz was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy

    redirect_to @quiz.theme, notice: 'Quiz was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_params
    params.require(:quiz).permit(
      :name,
      :title_da,
      :title_en,
      :subtitle_da,
      :subtitle_en,
      :result_title_da,
      :result_title_en,
      quiz_options_attributes: [
        :id,
        :option_da,
        :option_en,
        :answer_da,
        :answer_en
      ]
    )
  end

end
