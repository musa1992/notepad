class AddPasswordDigestToRelationshipOfficers < ActiveRecord::Migration[5.2]
  def change
    add_column :relationship_officers, :password_digest, :string
  end
end
