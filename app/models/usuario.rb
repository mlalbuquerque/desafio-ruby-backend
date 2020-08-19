class Usuario < ApplicationRecord
  %i[uid email nome primeiro_nome sobrenome foto token].each do |attribute|
    validates attribute, presence: true
  end

  %i[uid email token].each do |uniq_attribute|
    validates uniq_attribute, uniqueness: true
  end

  def self.load_info(options = {})
    usuario = find_by(uid: options[:id])
    return usuario if usuario

    user_params = { uid: :uid, email: :email, nome: :name, primeiro_nome: :given_name,
                    sobrenome: :family_name, foto: :picture, token: :access_token }
    opt = options.clone
    user_params.each { |k, v| opt[k] = opt[v] }
    create(opt.slice(*user_params.keys))
  end
end
