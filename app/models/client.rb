class Client < ApplicationRecord
    before_save {self.end_date = due_date + (((loan_duration - 1 ) * 7).days)}
    before_save {self.loan_schedule = generate_loan_schedule(self.due_date, self.loan_duration)}
    before_save {self.status = 'active'}
    belongs_to :relationship_officer
    validates :name, presence: true, length: {minimum: 6, maximum: 50}
    validates :phone_no, presence: true, length: {is: 10}, uniqueness: true
    validate :valid_phone  #fix using regex
    validates :relationship_officer_id, presence: true

    def format_date(date)
        date.split(" ").first
    end
    private

     def valid_phone
         errors.add(:phone_no, "Invalid format,number should start with zero") if phone_no.split("").first != "0"
     end

     def generate_loan_schedule(due_date, loan_duration)
        days = 7.days
        loan_schedule = [due_date]
        (loan_duration -1).times do 
            due_date += days
            loan_schedule << due_date
        end
        loan_schedule
     end
end
