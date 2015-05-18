# Homepage (Root path)
get '/' do
  erb :index
end

get '/users' do
  @users = User.all
  erb :'users/index'
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

post '/users' do
  @user = User.new(
    name:   params[:user_name],
    email:  params[:user_email]
  )
  if @user.save
    redirect '/users'
  else
    erb :'users/new'
  end
end

# get '/login' do
#   erg :'login'
# end

# get '/logout' do
#   session[:user_email] = ""  
#   redirect '/'
# end

# post '/login' do
#   @user = User.find_by_email(params[:user_email])

#   if @user
#     # authenticate
#     session[:user_email] = @user.email
#     redirect '/'
#   end
# end

# if session[:email] != ""
#   @current_user = User.find_by_email(session[:email])
# end

# helpers do
#   def user_logged_in?
#     session[:email] && session[:email] != ""
#   end

#   def get_current_user
#     if user_logged_in?
#       User.find_by_email(session[:email])
#     end
#   end
# end


get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  # @track.user = User.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find(params[:id])
  erb :'tracks/show'
end

post '/tracks' do
  @track = Track.new(
    song:   params[:song],
    album:  params[:album],
    artist:   params[:artist],
    url:   params[:url]
  )
  # @track.user = User.new(
  #   name: params[:user_name],
  #   email: params[:user_email]
  # )
  if @track.save # && @track.user.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end