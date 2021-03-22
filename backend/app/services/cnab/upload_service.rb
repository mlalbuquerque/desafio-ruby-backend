class Cnab::UploadService
  def initialize(file)
    @file = file
  end

  def call
    parse_file
  end

  private

  def read_file
    File.open(@file.tempfile.path, 'r')
  end

  def parse_file
    ActiveRecord::Base.transaction do
      file = read_file
      file.each do |line|
        owner = line[48..61].strip
        name = line[62..80].strip
        store = Store.find_or_create_by(name: name, owner: owner)
        transaction_type = TransactionType.find(line[0])
        date = row[1..8].to_date
        value = row[9..18].to_d
        cpf = row[19..29]
        card_number = row[30..42]
        hour = Time.parse("#{line[42..47][0..1]}:#{line[42..47][2..3]}:#{line[42..47][4..5]}")
        transaction = transaction_type.transactions.new
        transaction.date = date
        transaction.value = value / 100
        transaction.cpf = cpf
        transaction.card_number = card_number
        transaction.hour = hour
        transaction.store = store
        transaction.save!
      end
    end
  end
end