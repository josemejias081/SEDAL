class GroupsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_evaluator!, only: [:new, :create, :update]
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_group, except: [:index, :new, :create]
  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @users = User.all 
    @group = Group.new(group_params)
      if @group.save
        redirect_to groups_path
      else
        render :new        
      end
  end

  def index 
    if current_user.is_admin?
      @groups = Group.all.order("created_at DESC")
    else
      @groups = current_user.groups
    end
  end

  def show
    @evaluations = Evaluation.all
  end

  def edit
    @users = User.all
  end

  def update
      if @group.update(group_params)
        redirect_to @group
      else
        render :edit
      end
    end

  def destroy
    @group.destroy
    redirect_to @group
  end
  
  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:section, :responsible_id)
  end
end
