class ShortLoan < ApplicationRecord
    validates :loan_amount, presence: true, length: { in: 4..5 }, numericality: true
    validates :loan_duration, presence: true
    validates :instalment_amount, presence: true, length: { in: 3..5}, numericality: true




    private 

        def initial_loan_balance
            self.instalment_amount * self.loan_duration
        end

        def generate_loan_schedule
            
        end
end
