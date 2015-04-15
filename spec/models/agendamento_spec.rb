require 'rails_helper'

RSpec.describe Agendamento, :type => :model do
	let(:valid_attributes) {
		FactoryGirl.attributes_for(:agendamento)
	}

	context "relationships" do
		it { should belong_to(:user) }
	end

	context "validations" do
		it { should validate_presence_of(:horario) }
		it { should validate_inclusion_of(:horario).in_array(Agendamento::HORARIOS) }
		it { should validate_presence_of(:dia_semana) }
		it { should validate_inclusion_of(:dia_semana).in_array(Agendamento::DIAS) }
	end
end
