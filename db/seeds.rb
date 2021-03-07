ActiveRecord::Base.transaction do
  DEFAULT_PASSWORD = ENV.fetch('DEFAULT_PASSWORD', 'Impulso@2021')

  User.create!(name: 'Administrador', email: 'manager@impulso.work',
               password: DEFAULT_PASSWORD, manager: true)

  User.create!(name: 'Cliente', email: 'cliente@impulso.work',
               password: DEFAULT_PASSWORD)

  User.create!(name: 'Empresa', email: 'empresa@impulso.work',
               password: DEFAULT_PASSWORD)
end
