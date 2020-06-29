require 'sinatra'


get '/' do

    erb :index
    
end

post('/') do
    sentence = params[:sentence]
    words = sentence.gsub(/[,.]/,'').split(" ")
    magicWords = []
    words.each do |word|
        if word.length > 1
            magicWords << word if word == word.reverse
        end
    end
    status = 200
    headers = {"Content-Type" => "text/html"}
    body = ["<h1>Cantidad de palabras magicas detectadas: #{magicWords.length}</h1>"]
    [status,headers,body]
end