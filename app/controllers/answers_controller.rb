class AnswersController < ApplicationController

  before_action :set_answer, only: [:edit, :update, :destroy]
  before_action :set_scale
  before_action :authenticate_user!
  def new
    @answer = @scale.answer.build 
  end

  def create
    @answer = Answer.new(answer_params)
      if @answer.save
        redirect_to @scale
      else
        render :new
      end
  end

  def show 
    @answer = Answer.all
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    if @answer.update(answer_params)
      redirect_to @scale
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to @scale
  end

  private

    def set_answer 
      @answer = Answer.find(params[:id])
    end

    def answer_params 
      params.require(:answer).permit(:description, :value)
    end

    def set_scale
      @scale = Scale.find(params[:scale_id])
    end
end
