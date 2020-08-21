class ArquivoDecorator < Draper::Decorator
  delegate_all

  def name
    documento.blob.filename.to_s
  end

  def size
    h.number_to_human_size documento.blob.byte_size
  end

  def data_processado
    I18n.l model.data_processado, format: :long
  end
end
