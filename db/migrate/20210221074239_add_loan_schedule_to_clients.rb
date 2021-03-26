class AddLoanScheduleToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :loan_schedule, :text, array: true, default: [] 
  end
end
