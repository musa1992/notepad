class AddClientToShortLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :short_loans, :client, foreign_key: true, index: true
  end
end
