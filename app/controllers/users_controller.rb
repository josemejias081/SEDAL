class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def new 
    @groups = Group.all 
    @user = User.new
  end
  
  def index
    if params[:user_name]
      @pagy, @users = pagy(User.search(params[:user_name]), items: 12)
    else
      if current_user.is_admin?
        @pagy, @users = pagy(User.all.order("created_at DESC"), items: 12)

      else
        @pagy, @users = pagy(current_user.users, items: 12)
      end
    end
  end

  def show
    @evaluations = Evaluation.all
    
  end
  
  def create
    @groups = Group.all
    @user = User.new(user_params)
      if @user.save
        WelcomeMailer.notify(@user).deliver_now!
        flash[:success] = "Usuario creado exitosamente!"
        redirect_to users_path
      else
        render :new
      end
  end

  def edit
    @groups = Group.all
    @user.picture.attach(params[:picture])
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Usuario borrado exitosamente!"
    redirect_to @user
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :last_name, :address, :phone_number, :status, :place_of_birth,
          :disability, :num_identification, :appointment, :picture, :email, :password, :password_confirmation,
          :group_id, :permission_level)
    end
end
