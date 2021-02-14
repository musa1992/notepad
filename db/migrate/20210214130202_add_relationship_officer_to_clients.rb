class AddRelationshipOfficerToClients < ActiveRecord::Migration[5.2]
  def change
    add_reference :clients, :relationship_officer, foreign_key: true
  end
end
