class ApplicationController < Sinatra::Base
  
    set :default_content_type, 'application/json'
    # Add your routes here
    get "/" do
      "let's start"
    end
    def login_error
      @message = {error: "Invalid username or password"}
      return @message.to_json
    end
    # create a user account with username, password and email
    post '/newuser' do
      new_user = User.create(
        username: params[:username],
        email: params[:email],
        password: params[:password]
      )
      new_user.to_json
    end
    # login user using an email and a password
    post '/login' do
      password = params[:password]
      logging_user = User.find_by(email: params[:email])
      if (logging_user)
        if (logging_user.password == password)
          return logging_user.to_json
        else
          login_error
        end
      else
        login_error
      end
    end
    # create a new meme
    post '/newmeme/:id' do
      meme = User.find(params[:id]).meme.create(
        name 
      )
      meme.to_json
    end
    # get a given users meme
    get '/meme/:user_id' do
      user = params[:user_id].to_i
      memes = Meme.where(user_id: user)
      memes.to_json
    end
    # view all memes
    get '/memes' do
      memes = Meme.all.to_json
    end
    # view all users
    get '/users' do
      users = User.all.to_json
    end
    get '/user/:id' do
      user = User.find(params[:id])
      user.to_json(include: :movies)
    end
    # search for a given meme
    get '/search/:term' do
      term = params[:term]
      meme = Meme.where(year: term.to_i) ||  Meme.find_by(title: term)
      if meme
        return memee.to_json
      else
        error_message = {error: "Could not find meme that matches search term"}
        return error_message.to_json
      end
    end
     # update a meme's details
    patch '/edit/:id/:id2' do
      data = JSON.parse(request.body.read)
      meme = User.find(params[:id]).memes
      meme.find(params[:id2]).update(data)
      meme.to_json
    end
    # delete a meme from the site
    delete '/delete/:id/:id2' do
      meme = User.find(params[:id]).memes.find(params[:id2])
      meme.destroy
    end
end
