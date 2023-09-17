require 'sinatra'
require 'net/http'
require 'uri'

class Application < Sinatra::Base
  get '/' do
    send_file "formulario.html"
  end

  post '/enviar_para_aplicacao_secundaria' do
    puts "Aplicacao primaria: Recebi os dados do formulario e estou enviando para a aplicacao secundaria"
    url                     = URI("http://aplicacao_secundaria:3001/receber_dados_da_aplicacao_primaria")
    http                    = Net::HTTP.new(url.host, url.port)
    request                 = Net::HTTP::Post.new(url)
    request["Content-Type"] = "application/json"
    request.body            = { "dados" => params["dados"] }.to_json

    # begin
      response = http.request(request)
      send_file "sucesso.html"
    # rescue
      # send_file "erro.html"
    # end
  end
end
