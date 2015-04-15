class CreateAgendamentos < ActiveRecord::Migration
  def change
    create_table :agendamentos do |t|
    	t.string :dia_semana
      t.string :horario
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :agendamentos, :users
  end
end
