require 'sinatra'
require 'json'


class Application < Sinatra::Base
  post '/receber_dados_da_aplicacao_primaria' do
    puts "Aplicacao secundaria: Recebi os dados da aplicacao primaria e estou criando o arquivo .txt"

    request_body = request.body.read
    data         = JSON.parse(request_body)
    
    puts "#{request_body}"
    puts "Dados recebidos: #{data["dados"]}"

    begin
      file_path = File.join('/txts', "dados_#{Time.now}.txt")

      puts "Salvando arquivo em: #{file_path}"

      File.open(file_path, "w") do |file|
        file.write(data["dados"])
      end
      status 200
    rescue
      puts "Aplicacao secundaria: Erro ao criar o arquivo .txt"
    end
  end
end
