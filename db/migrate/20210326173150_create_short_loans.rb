class CreateShortLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :short_loans do |t|
      t.decimal :loan_amount, precision: 10, scale: 2
      t.decimal :initial_balance, precision: 10, scale: 2
      t.decimal :outstanding_loan_balance, precision: 10, scale: 2
      t.integer :loan_duration
      t.decimal :instalment_amount, precision: 10, scale: 2
      t.text :loan_schedule, default: [], array: true
      t.timestamps
    end
  end
end
