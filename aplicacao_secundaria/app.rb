require 'sinatra'


class Application < Sinatra::Base
  post '/receber_dados_da_aplicacao_primaria' do
    puts "Aplicacao secundaria: Recebi os dados da aplicacao primaria e estou criando o arquivo .txt"
    puts "Dados recebidos: #{params[:dados]}"

    begin
      file_path = File.join('/txts', "dados_#{Time.now}.txt")

      puts "Salvando arquivo em: #{file_path}"

      File.open(file_path, "w") do |file|
        file.write(params[:dados])
      end
    rescue
      puts "Aplicacao secundaria: Erro ao criar o arquivo .txt"
    end
  end
end
