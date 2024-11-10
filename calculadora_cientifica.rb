class CalculadoraCientifica
  # Constantes úteis
  GRAUS_PARA_RAD = Math::PI / 180
  RAD_PARA_GRAUS = 180 / Math::PI

  def initialize
    @memoria = 0
  end

  def soma(a, b)
    a + b
  end

  def subtracao(a, b)
    a - b
  end

  def multiplicacao(a, b)
    a * b
  end

  def divisao(a, b)
    raise 'Erro: Divisão por zero!' if b.zero?
    a / b
  end

  def potencia(base, expoente)
    base ** expoente
  end

  def raiz_quadrada(numero)
    raise 'Erro: Número negativo!' if numero < 0
    Math.sqrt(numero)
  end

  def seno(angulo)
    Math.sin(angulo)
  end

  def cosseno(angulo)
    Math.cos(angulo)
  end

  def tangente(angulo)
    Math.tan(angulo)
  end

  def logaritmo(numero, base = Math::E)
    raise 'Erro: Número deve ser positivo!' if numero <= 0
    Math.log(numero, base)
  end

  def fatorial(n)
    return 1 if n == 0
    (1..n).reduce(:*)
  end

  def armazenar_memoria(valor)
    @memoria = valor
  end

  def recuperar_memoria
    @memoria
  end

  def limpar_memoria
    @memoria = 0
  end

  # Novas funções trigonométricas
  def secante(angulo)
    1 / Math.cos(angulo)
  end

  def cossecante(angulo)
    1 / Math.sin(angulo)
  end

  def cotangente(angulo)
    1 / Math.tan(angulo)
  end

  # Funções trigonométricas inversas
  def arco_seno(x)
    raise 'Erro: Valor fora do domínio [-1, 1]' if x < -1 || x > 1
    Math.asin(x)
  end

  def arco_cosseno(x)
    raise 'Erro: Valor fora do domínio [-1, 1]' if x < -1 || x > 1
    Math.acos(x)
  end

  def arco_tangente(x)
    Math.atan(x)
  end

  # Funções hiperbólicas
  def seno_hiperbolico(x)
    Math.sinh(x)
  end

  def cosseno_hiperbolico(x)
    Math.cosh(x)
  end

  def tangente_hiperbolica(x)
    Math.tanh(x)
  end

  # Conversões de ângulos
  def graus_para_radianos(graus)
    graus * GRAUS_PARA_RAD
  end

  def radianos_para_graus(radianos)
    radianos * RAD_PARA_GRAUS
  end

  # Operações com porcentagem
  def porcentagem(valor, percentual)
    (valor * percentual) / 100.0
  end

  def adicionar_percentual(valor, percentual)
    valor + porcentagem(valor, percentual)
  end

  def subtrair_percentual(valor, percentual)
    valor - porcentagem(valor, percentual)
  end

  # Funções estatísticas básicas
  def media(numeros)
    numeros.sum.to_f / numeros.length
  end

  def mediana(numeros)
    ordenados = numeros.sort
    meio = ordenados.length / 2
    if ordenados.length.odd?
      ordenados[meio]
    else
      (ordenados[meio-1] + ordenados[meio]) / 2.0
    end
  end

  def desvio_padrao(numeros)
    med = media(numeros)
    variancia = numeros.map { |num| (num - med) ** 2 }.sum / numeros.length
    Math.sqrt(variancia)
  end

  # Outras funções matemáticas
  def raiz_enesima(numero, n)
    raise 'Erro: Índice inválido!' if n == 0
    numero ** (1.0 / n)
  end

  def logaritmo_base_10(numero)
    Math.log10(numero)
  end

  def valor_absoluto(numero)
    numero.abs
  end

  def arredondar(numero, decimais = 0)
    numero.round(decimais)
  end

  def combinacao(n, r)
    fatorial(n) / (fatorial(r) * fatorial(n - r))
  end

  def permutacao(n, r)
    fatorial(n) / fatorial(n - r)
  end
end

# Exemplo de uso
calc = CalculadoraCientifica.new

# Operações básicas
puts "2 + 3 = #{calc.soma(2, 3)}"
puts "5 - 2 = #{calc.subtracao(5, 2)}"
puts "4 * 3 = #{calc.multiplicacao(4, 3)}"
puts "10 / 2 = #{calc.divisao(10, 2)}"

# Operações avançadas
puts "2³ = #{calc.potencia(2, 3)}"
puts "√16 = #{calc.raiz_quadrada(16)}"
puts "sen(π/2) = #{calc.seno(Math::PI/2)}"
puts "cos(0) = #{calc.cosseno(0)}"
puts "tan(π/4) = #{calc.tangente(Math::PI/4)}"
puts "ln(2.718) = #{calc.logaritmo(Math::E)}"
puts "5! = #{calc.fatorial(5)}"

# Usando memória
calc.armazenar_memoria(42)
puts "Valor na memória: #{calc.recuperar_memoria}"
calc.limpar_memoria
puts "Memória após limpar: #{calc.recuperar_memoria}"

# Funções Trigonométricas Avançadas
puts "\nFunções Trigonométricas Avançadas:"
puts "sec(π/3) = #{calc.secante(Math::PI/3)}"
puts "arcsen(0.5) = #{calc.arco_seno(0.5)}"

# Funções Hiperbólicas
puts "\nFunções Hiperbólicas:"
puts "sinh(1) = #{calc.seno_hiperbolico(1)}"
puts "cosh(1) = #{calc.cosseno_hiperbolico(1)}"

# Conversões
puts "\nConversões:"
puts "45 graus = #{calc.graus_para_radianos(45)} radianos"
puts "π/4 radianos = #{calc.radianos_para_graus(Math::PI/4)} graus"

# Porcentagem
puts "\nPorcentagem:"
puts "15% de 200 = #{calc.porcentagem(200, 15)}"
puts "200 + 15% = #{calc.adicionar_percentual(200, 15)}"

# Estatística
puts "\nEstatística:"
numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9]
puts "Média: #{calc.media(numeros)}"
puts "Mediana: #{calc.mediana(numeros)}"
puts "Desvio Padrão: #{calc.desvio_padrao(numeros)}"

# Outras Funções
puts "\nOutras Funções:"
puts "Raiz cúbica de 27 = #{calc.raiz_enesima(27, 3)}"
puts "log10(100) = #{calc.logaritmo_base_10(100)}"
puts "C(5,2) = #{calc.combinacao(5, 2)}"
puts "P(5,2) = #{calc.permutacao(5, 2)}" 