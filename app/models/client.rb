class Client < ApplicationRecord
    before_save {self.end_date = due_date + ((loan_duration * 7).days)}
    belongs_to :relationship_officer
    validates :name, presence: true, length: {minimum: 6, maximum: 50}
    validates :phone_no, presence: true, length: {is: 10}
    validate :valid_phone  #fix using regex
    validates :relationship_officer_id, presence: true

   
    private

     def valid_phone
         errors.add(:phone_no, "Invalid format,number should start with zero") if phone_no.split("").first != "0"
     end


end
