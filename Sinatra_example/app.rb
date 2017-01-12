require 'sinatra'

get '/frank-says' do
  'Put this in your pipe & smoke it!'
end

get '/' do
	'My first Sinatra app.'
end

get '/nen' do
	@name = "NeN"
	erb(:nen)
end

