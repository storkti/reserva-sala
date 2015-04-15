class Agendamento < ActiveRecord::Base
	DIAS = { '2' => 'Segunda', '3' => 'Terça', '4' => 'Quarta', '5' => 'Quinta', '6' => 'Sexta' }
	HORARIOS = ['06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00', 
			'19:00', '20:00', '21:00', '22:00', '23:00']

  belongs_to :user

  validates :dia_semana, presence: true, inclusion: {:in => DIAS.keys}
  validates :horario, presence: true, inclusion: {:in => HORARIOS}

  def dia_semana_extenso
  	DIAS[dia_semana]
  end
end
