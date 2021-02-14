class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone_no
      t.datetime :due_date
      t.datetime :end_date
      t.integer :loan_duration
      t.decimal :installment_amount

      t.timestamps
    end
  end
end
