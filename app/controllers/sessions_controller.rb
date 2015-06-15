  class SessionsController < ApplicationController
    skip_before_filter :authenticate

    def from_oauth
      auth = request.env['omniauth.auth'] 
      binding.pry
      return
=begin
      if(auth.nil? or auth["info"]["email"].nil?)
        redirect_to "/oauth-fail"
      else
        email = auth["info"]["email"]
        user = User.where(email: email).first
        user = User.where(facebook_id: auth["uid"]).first_or_initialize unless user
        if email == "hilary.dykes@gmail.com" or email == "gregkerzhner@gmail.com"
          user.role = "admin"
        end
        user.password = SecureRandom.hex unless user.password_digest
        user.first_name = auth["info"]["first_name"] if user.first_name.blank?
        user.last_name = auth["info"]["last_name"] if user.last_name.blank?
        user.email =  auth["info"]["email"] if user.email.blank?
        user.last_sign_in_at = Time.now
        user.save
        user.reload

        token = auth["credentials"]["token"]
        user_session = UserSession.create(user_id: user.id, auth_token: token)
        redirect_to "/bookmarks?auth_token="+token
      end
    end
=end
  end