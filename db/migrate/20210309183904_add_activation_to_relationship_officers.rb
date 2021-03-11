class AddActivationToRelationshipOfficers < ActiveRecord::Migration[5.2]
  def change
    add_column :relationship_officers, :activation_digest, :string
    add_column :relationship_officers, :activated, :boolean, default:false
    add_column :relationship_officers, :activated_at, :datetime
  end
end
