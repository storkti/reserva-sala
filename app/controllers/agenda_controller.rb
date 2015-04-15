class AgendaController < ApplicationController
	before_action :authenticate_user!
	before_action :set_agendamento, only: [:agendar, :desmarcar]

  def index
  	@agendamentos = Agendamento.order( :horario, :dia_semana )
  end

  def agendar
  	@agendamento.update user: current_user
    render json: @agendamento, include: :user, status: :ok
  end

  def desmarcar
    @agendamento.update user: nil
    render json: @agendamento, status: :ok
  end

  private
  	def set_agendamento
  		@agendamento = Agendamento.find params[:id]
  	end
end
