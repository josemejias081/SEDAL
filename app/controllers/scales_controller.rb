class ScalesController < ApplicationController
  load_and_authorize_resource
  before_action :set_scale, except: [:index, :new, :create]
  before_action :authenticate_evaluator!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy]

  def new
    @scale = Scale.new
    answer = @scale.answers.build
  end
  
  def create
    @scale = Scale.new(scale_params)
      if @scale.save
        redirect_to scales_path
      else
        render :new
      end
    end

  def show
    @answer = @scale.answers.build
  end

  def index
    @scales = Scale.all.order("created_at DESC")
  end

  def edit
    @scale = Scale.find(params[:id])
  end

  def update    
    if @scale.update(scale_params)
      redirect_to @scale
    else
      render :edit
    end    
  end

  def destroy
    @scale.destroy
    redirect_to @scale
  end

  private
    def set_scale
      @scale = Scale.find(params[:id])
    end

    def scale_params
      params.require(:scale).permit(:description, answers_attributes: [:id, :description, :value, :_destroy])
    end
end
