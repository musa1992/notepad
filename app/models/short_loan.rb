class ShortLoan < ApplicationRecord
    validates :loan_amount, presence: true, length: { in: 4..5 }, numericality: true
    validates :loan_duration, presence: true
    validates :instalment_amount, presence: true, length: { in: 3..5 }, numericality: true
    validates :due_date, presence: true
    before_save :generate_loan_schedule(self.due_date, self.loan_duration)
    before_save :initial_loan_balance
    belongs_to :client
    belongs_to :relationship_officer

    private 

        def initial_loan_balance
            self.initial_balance = self.instalment_amount * self.loan_duration
            self.outstanding_loan_balance = self.initial_balance
        end

        def generate_loan_schedule(due_date, loan_duration)
            days = 7.days
            status = 'Not Paid'
            due_date_status = Hash.new
            due_date_status[due_date] = status
            @loan_schedule = [due_date_status]
            (loan_duration -1).times do 
                due_date += days
                due_date_status[due_date] = status
                @loan_schedule << due_date_status
            end
            self.loan_schedule = @loan_schedule
        end

end
