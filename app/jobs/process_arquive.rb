class ProcessArquive < ApplicationJob
  queue_as :default

  def build_local_file
    @path = Rails.root.join("tmp/f#{@arquive.documento.blob.key}/")
    FileUtils.mkdir @path unless File.exist?(@path)
    @file = "#{@path}_#{@arquive.documento.blob.filename}"
    @arquive.documento.open do |f|
      FileUtils.cp(f, @file)
    end
  end

  def process_file
    content = File.read(@file)
    lines = content.split("\n")
    @arquive.update linhas: lines.size
    lines.each_with_index do |line, i|
      process_line(line, i)
    end
  end

  def process_line(line, index)
    prm = {
      line: line,
      i: index,
      arquive: @arquive
    }
    parser = CnabParser::Version01.new prm
    Registro.parser(parser).save
  end

  def delete_tmp_files
    FileUtils.remove_dir(@path) if File.exist?(@path)
  end

  def process_arquive
    build_local_file
    process_file
    delete_tmp_files
  end

  def perform(arquive_id)
    @arquive = Arquivo.find arquive_id
    process_arquive
    @arquive.update data_processado: DateTime.now
  end
end
