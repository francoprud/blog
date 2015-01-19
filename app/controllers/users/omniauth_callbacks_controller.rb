class Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_google_oauth2(request.env['omniauth.auth'], current_user)

      user_persistance('Google', 'devise.google_data')
    end

    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.find_for_facebook_oauth(request.env['omniauth.auth'], current_user)

      user_persistance('Facebook', 'devise.facebook_data')
    end

    private

    def user_persistance(kind, data)
      if @user.persisted?
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: kind
        sign_in_and_redirect @user, event: :authentication
      else
        session[data] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
  end
end
