require 'rails_helper'

RSpec.describe AgendaController, :type => :controller do
  
  let(:valid_attributes) {
    FactoryGirl.build(:agendamento).attributes
  }

  describe "with logged user" do
  
    before do
      @logged_user = login_user
    end

    describe "GET index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "Atribui todos agendamentos em @agendametos" do
        agendamento = Agendamento.create! valid_attributes
        get :index, {}
        expect(assigns(:agendamentos)).to eq([agendamento])
      end
    end

    describe "PATCH agendar" do
      it "returns http success" do
        agendamento = Agendamento.create! valid_attributes
        patch :agendar, {:id => agendamento.to_param} 
        expect(response).to have_http_status(:success)
      end

      it "altera o usuario para o usuario logado" do
        agendamento = Agendamento.create! valid_attributes
        expect{ 
          patch :agendar, {:id => agendamento.to_param} 
          agendamento.reload
        }.to change{ agendamento.user }.from(nil).to(@logged_user)
      end
    end

    describe "PATCH desmarcar" do
      it "returns http success" do
        agendamento = Agendamento.create! valid_attributes.merge(user: FactoryGirl.create(:user))
        patch :desmarcar, {:id => agendamento.to_param} 
        expect(response).to have_http_status(:success)
      end

      it "remove o usuario associado" do
        agendamento = Agendamento.create! valid_attributes.merge(user: FactoryGirl.create(:user))
        expect{ 
          patch :desmarcar, {:id => agendamento.to_param} 
          agendamento.reload
        }.to change{ agendamento.user }.to(nil)
      end
    end

  end
end
