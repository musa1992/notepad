class AddActivationTokenToRelationshipOfficers < ActiveRecord::Migration[5.2]
  def change
    add_column :relationship_officers, :activation_token, :string
  end
end
