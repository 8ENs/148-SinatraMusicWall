# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

get '/tracks/:id' do
  @track = Track.find params[:id]
  erb :'tracks/show'
end

post '/tracks' do
  @track = Track.new(
    song:   params[:song],
    album:  params[:album],
    artist:   params[:artist],
    url: params[:url],
    fan:   params[:fan]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end