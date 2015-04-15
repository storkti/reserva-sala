FactoryGirl.define do
  factory :agendamento do
    horario Agendamento::HORARIOS[0]
		dia_semana Agendamento::DIAS[0]
		user nil
  end

end
