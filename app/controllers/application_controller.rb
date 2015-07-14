class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter do
    resource = controller_name.singularize.to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :activity

  after_filter :store_location

    def store_location
      # store last url - this is needed for post-login redirect to whatever the user last visited.
      return unless request.get? 
      if (request.path != "/users/sign_in" &&
          request.path != "/users/sign_up" &&
          request.path != "/users/password/new" &&
          request.path != "/users/password/edit" &&
          request.path != "/users/confirmation" &&
          request.path != "/users/sign_out" &&
          !request.xhr?) # don't store ajax calls
        session[:previous_url] = request.fullpath 
      end
    end

    def after_sign_in_path_for(resource)
      session[:previous_url] || root_path
    end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to howtobeexecutor_path, :alert => "Только исполнители могут подавать заявки, писать комментарии"
  end

  def track_activity(user, trackable, action, author = current_user)
    Activity.create! user: user, trackable: trackable, action: action, author: author
  end

  def activity
    if signed_in?
      @activities = current_user.activities.includes(:author, :trackable).where(read: false).order(created_at: :desc)
    end
  end

  def activity_read
   
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email, :birthday, :city_id, posts_attributes: [:name, :content, :date, :time, :user_id, :category_id, :price, :adress, :adress1, :status, :count, :phone, :city_id, :statusfromexecutor, :slug]]
    devise_parameter_sanitizer.for(:account_update) << [:hourprice, :serviceprice, :about, :name, :phone, :avatar, :birthday, :city_id, :gender, :slug, :last_name]  
  end
end