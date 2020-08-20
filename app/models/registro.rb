class Registro < ApplicationRecord
  belongs_to :tipo_de_transacao
  belongs_to :beneficiario
  belongs_to :cartao
  belongs_to :loja
  belongs_to :arquivo

  def self.parser(parser)
    case parser
    when CnabParser::Version01
      parser_v01(parser)
    else
      raise_("Unsupporter parser #{parser.class}")
    end
  end

  def value
    valor * tipo_de_transacao.factor
  end

  class << self
    private

    def parser_v01(parser)
      new(parser.params)
    end
  end
end
