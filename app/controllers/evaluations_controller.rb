class EvaluationsController < ApplicationController
  load_and_authorize_resource
  before_action :set_evaluation, except: [:index, :new, :create]
  before_action :authenticate_evaluator!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy]

  def new
    @evaluation = Evaluation.new
    item = @evaluation.items.build
    @scales = Scale.all 
  end

  def index
    if params[:evaluation_title]
      @evaluations = Evaluation.search(params[:evaluation_title])
    else
      @evaluations = Evaluation.all.order("created_at DESC")
    end
  end

  def show
    @item = @evaluation.items.build
  end

  def create
    @evaluation = current_user.evaluations.new(evaluation_params)
      if @evaluation.save
        redirect_to evaluations_path
      else
        render :new
      end
    end

  def edit
    @scales = Scale.all
  end

  def update    
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation 
    else
      render :edit
    end    
  end

  def destroy
    @evaluation.destroy
    redirect_to @evaluation 
  end

  def mostrar
    @evaluations = Evaluation.all
  end

  private

    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:title, :description, :pub_date, items_attributes: [:id, :description, :_destroy, :scale_id])
    end
end
