class CreateMetrics < ActiveRecord::Migration[5.2]
  def change
    create_table :metrics do |t|
      t.datetime :date
      t.decimal :amount_due, precision: 10, scale: 2
      t.decimal :amount_collected, precision: 10, scale: 2
      t.integer :accounts_due
      t.references :relationship_officer, foreign_key: true, index: true

      t.timestamps
    end
  end
end
