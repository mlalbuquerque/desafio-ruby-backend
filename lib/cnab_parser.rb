module CnabParser
  class Version01
    private

    attr_accessor :i, :arquive

    public

    def initialize(options = { line: nil, i: nil, arquive: nil })
      @line = options[:line]
      @i = options[:i]
      @arquive = options[:arquive]
      @dict = {
        # [start, size]
        tipo: [0,   1],
        data: [1,   8],
        valor: [9,  10],
        cpf: [19, 11],
        cartao: [30, 12],
        hora: [42, 6],
        dono_da_loja: [48, 14],
        nome_da_loja: [62, 19]
      }
    end

    def tipo_id
      @line[*@dict[:tipo]]
    end

    def tipo
      TipoDeTransacao.where tipo: tipo_id
    end

    def data
      Date.parse @line[*@dict[:data]]
    end

    def valor
      BigDecimal(@line[*@dict[:valor]]) / 100
    end

    def cpf
      @line[*@dict[:cpf]]
    end

    def beneficiario
      Beneficiario.first_or_create(cpf: cpf)
    end

    def numero_cartao
      @line[*@dict[:cartao]]
    end

    def cartao
      Cartao.first_or_create(numero: numero_cartao)
    end

    def hora(zone = 'Brasilia')
      offset = ActiveSupport::TimeZone[zone].formatted_offset
      Time.strptime(@line[*@dict[:hora]] + offset, '%H%M%S%:z')
    end

    def dono_da_loja
      @line[*@dict[:dono_da_loja]].strip
    end

    def nome_da_loja
      @line[*@dict[:nome_da_loja]].strip
    end

    def loja
      Loja.first_or_create(nome: nome_da_loja, representante: dono_da_loja)
    end

    def params
      map = {
        data: :data,
        valor: :valor,
        hora: :hora,
        linha_no_arquivo: :i,
        tipo_de_transacao_id: :tipo_id,
        beneficiario: :beneficiario,
        cartao: :cartao,
        loja: :loja,
        arquivo: :arquive
      }
      params_hash = {}
      map.each { |k, v| params_hash[k] = send(v) }
      params_hash
    end
  end
end
