require 'sinatra/base'
require 'json'
require_relative 'calculadora_cientifica'

class CalculadoraApp < Sinatra::Base
  # Habilitar CORS para permitir requisições AJAX
  configure do
    enable :cross_origin
  end
  
  before do
    content_type :json
    headers 'Access-Control-Allow-Origin' => '*'
  end

  calc = CalculadoraCientifica.new

  get '/' do
    content_type :html
    erb :index
  end

  post '/calcular' do
    begin
      params = JSON.parse(request.body.read)
      operacao = params['operacao']
      valores = params['valores'].map(&:to_f)
      
      resultado = case operacao
      when 'soma'
        calc.soma(valores[0], valores[1])
      when 'subtracao'
        calc.subtracao(valores[0], valores[1])
      when 'multiplicacao'
        calc.multiplicacao(valores[0], valores[1])
      when 'divisao'
        calc.divisao(valores[0], valores[1])
      when 'potencia'
        calc.potencia(valores[0], valores[1])
      when 'raiz_quadrada'
        calc.raiz_quadrada(valores[0])
      when 'seno'
        calc.seno(calc.graus_para_radianos(valores[0]))
      when 'cosseno'
        calc.cosseno(calc.graus_para_radianos(valores[0]))
      when 'tangente'
        calc.tangente(calc.graus_para_radianos(valores[0]))
      when 'logaritmo'
        calc.logaritmo(valores[0])
      when 'fatorial'
        calc.fatorial(valores[0].to_i)
      end

      { resultado: resultado }.to_json
    rescue => e
      status 400
      { erro: e.message }.to_json
    end
  end
end 