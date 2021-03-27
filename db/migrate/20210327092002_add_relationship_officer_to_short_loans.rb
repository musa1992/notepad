class AddRelationshipOfficerToShortLoans < ActiveRecord::Migration[5.2]
  def change
    add_reference :short_loans, :relationship_officer, foreign_key: true, index: true
  end
end
