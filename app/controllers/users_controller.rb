class UsersController < ApplicationController

	def show
    	@user = User.friendly.find(params[:id])
    	@usertaskcount = Post.where(executor_id: @user.id, status: 3)
      #@users = User.all
      #@reviews = @user.reviewss#.where(negative: params[:negative]) if params[:negative].present?
      #@reviews = Review.where(for_user_id: @user, negative: 0)#params[:negative]) if params[:negative].present?
      #@reviews = @reviews
      #@reviews = @reviews
      @reviews = @user.reviewss.where(negative: 0)
      @reviews = @user.reviewss.where(negative: params[:negative]) if params[:negative].present?
      @reviews = @reviews
    end

    def index
    	@users = User.includes(:roles).references(:roles).where(roles: { id: 4 })
      @users = User.includes(:ecategories, :roles).references(:ecategories, :roles).where(ecategories: {id: params[:ecategory_id]}, roles: { id: 4 }) if params[:ecategory_id].present?
      @users = @users
    end

    def update
    	@user = User.friendly.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end


    def edit
      @user = User.friendly.find(params[:id])
      @usertaskcount = Post.where(executor_id: @user.id, status: 3)
    end

    def update_password
      @user = User.friendly.find(current_user.id)
      if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end


   def change_role
   	@user =  User.friendly.find(params[:id])
   end

  private

  def user_params
    params.require(:user).permit(:slug, :password, :password_confirmation, :serviceprice, :city_id, :phone, :birthday, :avatar, :gender, :hourprice, :about, :name, role_ids: [], ecategory_ids: [], category_ids: [])
  end
end