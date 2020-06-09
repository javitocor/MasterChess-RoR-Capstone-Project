class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    include OmniConcern
    
    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.create_from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  
    def failure
      redirect_to root_path
    end
    def twitter
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.create_from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "twitter") if is_navigational_format?
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  
    def failure
      redirect_to root_path
    end
    def gplus
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.create_from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "gplus") if is_navigational_format?
      else
        session["devise.gplus_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  
    def failure
      redirect_to root_path
    end

    def linkedin
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.create_from_omniauth(request.env["omniauth.auth"])
  
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Linkedin") if is_navigational_format?
      else
        session["devise.linkedin_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  
    def failure
      redirect_to root_path
    end
  end