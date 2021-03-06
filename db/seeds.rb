ActiveRecord::Base.transaction do
  User.create!(name: 'Admin', email: 'admin@impulso.work',
               password: '12345678', manager: true)

  User.create!(name: 'Cliente', email: 'customer@impulso.work',
               password: '12345678')
end
