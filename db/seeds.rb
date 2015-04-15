# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Agendamento::HORARIOS.each do |horario|
	Agendamento::DIAS.keys.each do |dia_semana|
		Agendamento.create horario: horario, dia_semana: dia_semana
	end
end