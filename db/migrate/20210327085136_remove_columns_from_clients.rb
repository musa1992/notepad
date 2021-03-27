class RemoveColumnsFromClients < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :due_date, :datetime
    remove_column :clients, :end_date, :datetime
    remove_column :clients, :loan_duration, :integer
    remove_column :clients, :installment_amount, :decimal
    remove_column :clients, :loan_schedule, :text
  end
end
