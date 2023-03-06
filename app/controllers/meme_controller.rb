class MemeController < AppController

    set :default_content_type, 'application/json'

    #Display all memes
    get '/memes' do
        memes = Meme.all
        memes.to_json(include: { user: {only: [:full_name]}})
    end

    # Display memes by id
    get '/memes/:id' do
        meme = Meme.find(params[:id])
        meme.to_json
    end

    # Add new meme
    post '/memes' do
        meme = Meme.create(
            name: params[:name],
            url: params[:url],
            user_id: params[:user_id]
        )
    end

    # Update meme
    patch '/memes/:id' do
        meme = Meme.find(params[:id])
        meme.update(
            name: params[:name],
            url: params[:url]
        )
        meme.to_json
    end


    # Delete specific meme
    delete '/memes/:id' do
        meme = Meme.find(params[:id])
        meme.destroy
        meme.to_json
    end

end