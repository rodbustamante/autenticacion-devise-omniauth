class AuthenticationsController < ApplicationController
	
	def index
	end

	def destroy
 		@authentication = Authentication.find(params[:id])
 		@authentication.destroy
 		redirect_to authentications_url, :notice => "Autenticación destruida exitosamente."
   	end

	def all
		omniauth = request.env["omniauth.auth"]
     	authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])

     	if authentication
       		flash[:notice] = "Usuario logueado con éxito."
       		sign_in_and_redirect User.find(authentication.user_id)
     	elsif current_user
       		token = omniauth['credentials'].token

       		if omniauth['provider'] == "twitter"
       			token_secret = omniauth['credentials'].secret
       		else
       			token_secret = ""
       		end		

   			current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'], :token => token, :token_secret => token_secret)
   			
   			flash[:notice] = "Autenticación exitosa."
       		sign_in_and_redirect current_user
     	else
       		user = User.new 

       		user.email = omniauth['extra']['raw_info'].email if omniauth['provider'] == 'facebook'

       		user.apply_omniauth(omniauth)

	       	if user.save
	     		flash[:notice] = "Logueado con éxito."
	         	sign_in_and_redirect User.find(user.id)             
	       	else
	     		session[:omniauth] = omniauth.except('extra')
	     		redirect_to new_user_registration_path
	       	end
	 	end 
   	end
	alias_method :twitter, :all
	alias_method :facebook, :all
 	
end
