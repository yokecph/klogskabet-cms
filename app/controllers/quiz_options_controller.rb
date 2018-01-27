class QuizOptionsController < ApplicationController
  before_action :set_quiz, only: [:index, :new, :create]
  before_action :set_quiz_option, only: [:show, :edit, :update, :destroy]

  # GET /quiz_options
  # GET /quiz_options.json
  def index
    @quiz_options = @quiz.quiz_options.all
  end

  # GET /quiz_options/1
  # GET /quiz_options/1.json
  def show
  end

  # GET /quiz_options/new
  def new
    @quiz_option = @quiz.quiz_options.new
  end

  # GET /quiz_options/1/edit
  def edit
  end

  # POST /quiz_options
  # POST /quiz_options.json
  def create
    @quiz_option = @quiz.quiz_options.new(quiz_option_params)

    respond_to do |format|
      if @quiz_option.save
        format.html { redirect_to @quiz_option, notice: 'Quiz option was successfully created.' }
        format.json { render :show, status: :created, location: @quiz_option }
      else
        format.html { render :new }
        format.json { render json: @quiz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quiz_options/1
  # PATCH/PUT /quiz_options/1.json
  def update
    respond_to do |format|
      if @quiz_option.update(quiz_option_params)
        format.html { redirect_to @quiz_option, notice: 'Quiz option was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_option }
      else
        format.html { render :edit }
        format.json { render json: @quiz_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_options/1
  # DELETE /quiz_options/1.json
  def destroy
    @quiz_option.destroy
    respond_to do |format|
      format.html { redirect_to @quiz_option.quiz, notice: 'Quiz option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def set_quiz_option
    @quiz_option = QuizOption.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_option_params
    params.require(:quiz_option).permit(:option_da, :option_en, :answer_da, :answer_en)
  end
end
