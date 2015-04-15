class AgendaController < ApplicationController
	before_action :authenticate_user!
	before_action :set_agendamento, only: [:agendar, :desmarcar]

  def index
  	@agendamentos = Agendamento.all
  end

  def agendar
  	if @agendamento.update user: current_user
  		head :ok
  	else
  		head :not_modified
  	end
  end

  def desmarcar
  	if @agendamento.update user: nil
  		head :ok
  	else
  		head :not_modified
  	end
  end

  private
  	def set_agendamento
  		@agendamento = Agendamento.find params[:id]
  	end
end
