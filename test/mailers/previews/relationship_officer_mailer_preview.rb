# Preview all emails at http://localhost:3000/rails/mailers/relationship_officer_mailer
class RelationshipOfficerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/relationship_officer_mailer/account_activation
  def account_activation
    officer = RelationshipOfficer.first
    officer.activation_token = RelationshipOfficer.new_token
    RelationshipOfficerMailer.account_activation(officer)
  end

  # Preview this email at http://localhost:3000/rails/mailers/relationship_officer_mailer/password_reset
  def password_reset
    RelationshipOfficerMailer.password_reset
  end

end
