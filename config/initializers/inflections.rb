ActiveSupport::Inflector.inflections(:en) do |inflect|
  # sem acentuacao
  inflect.plural(/ao$/i, '\1oes')
  inflect.singular(/oes$/i, '\1ao')

  # com acentuacao
  inflect.plural(/ão$/i, '\1ões')
  inflect.singular(/ões$/i, '\1ão')

  # inflect.irregular 'person', 'people'
  # inflect.uncountable %w( fish sheep )
end
