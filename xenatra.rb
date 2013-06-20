# ustify.rb
require 'rubygems'
require 'sinatra'
require 'haml'
require 'dm-core'
require 'dm-migrations'
require 'dm-validations'
require 'dm-types'
require 'dm-serializer'
require 'json'
require 'pony'

require './lib/helpers'


 
class Xenatra < Sinatra::Base

  enable :logging  
  


  before do
    headers "Content-Type" => "text/html; charset=utf-8"
  end



  helpers Sinatra::Partials

  helpers do


#    def current_user
#      @current_user ||= session[:uid] if session[:uid] && !session[:verify]
#    end

    def mailto(to,subject,body)
      
      configure :production do
        Pony.mail :to => to,
                  :from => 'noreply@example.com',
                  :subject => subject,
                  :body => body
      end

      configure :development do
        logtext = ' would send mail to ' + to + ' with subject: ' + subject
        logger.info logtext
      end


    end


#    def current_username
#      @current_username = request.env['omniauth.auth']["info"]["name"]
#    end

  end


  
  get '/' do
    haml :index
  end
  



end
