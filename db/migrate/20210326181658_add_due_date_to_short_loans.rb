class AddDueDateToShortLoans < ActiveRecord::Migration[5.2]
  def change
    add_column :short_loans, :due_date, :datetime
  end
end
