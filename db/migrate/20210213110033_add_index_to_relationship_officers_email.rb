class AddIndexToRelationshipOfficersEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :relationship_officers, :email, unique: true
  end
end
