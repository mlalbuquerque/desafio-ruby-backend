require 'faker'
namespace :dev do
  DEFAULT_PASSWORD = "123456"
  desc "Set up the development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping DB...") {%x(docker-compose run --rm app bundle exec rails db:drop)}

      show_spinner("Creating DB...") {%x(docker-compose run --rm app bundle exec rails db:create)}

      show_spinner("Migrando DB...") {%x(docker-compose run --rm app bundle exec rails db:migrate)}
      
      show_spinner("Registering standard user...") {%x(docker-compose run --rm app bundle exec rails dev:registering_standard_user)}

      show_spinner("Registering standard user...") {%x(docker-compose run --rm app bundle exec rails dev:add_standard_user)}
    else
      puts "You are not in the development enviroment"
    end
  end

  desc "Registering standard user"
  task add_standard_user: :enviroment do
    u = User.new(
      name:  Faker::Name.name,
      email: "john.doe@example.com",
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD,
      nickname: "john"
    )
    u.save!
  end

  desc "Registerin Transaction Types"
  task add_transaction_types: :enviroment do
    TransactionType.create(description: 'Débito',          nature: 'Entrada', signal: '+')
    TransactionType.create(description: 'Boleto',          nature: 'Saida', signal: '-')
    TransactionType.create(description: 'Financiamento',   nature: 'Saida', signal: '-')
    TransactionType.create(description: 'Crédito',         nature: 'Entrada', signal: '+')
    TransactionType.create(description: "Recebimento Empréstimo\t", nature: 'Entrada', signal: '+')
    TransactionType.create(description: 'Vendas',          nature: 'Entrada', signal: '+')
    TransactionType.create(description: 'Recebimento TED', nature: 'Entrada', signal: '+')
    TransactionType.create(description: 'Recebimento DOC', nature: 'Entrada', signal: '+')
    TransactionType.create(description: 'Aluguel',         nature: 'Saida',   signal: '-')
  end

  private
  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner) #{msg_start}", format: :dots_9)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
