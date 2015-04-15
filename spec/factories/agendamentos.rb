FactoryGirl.define do
  factory :agendamento do
    horario Agendamento::HORARIOS.first
		dia_semana Agendamento::DIAS.keys.first
		user nil
  end

end
