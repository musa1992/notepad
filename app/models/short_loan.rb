class ShortLoan < ApplicationRecord

    validates :loan_amount, presence: true, length: { in: 4..12 }, numericality: true
    validates :loan_duration, presence: true
    validates :instalment_amount, presence: true, length: { in: 3..12 }, numericality: true
    validates :due_date, presence: true
    before_create :generate_loan_schedule
    before_create :initial_loan_balance
    belongs_to :client, inverse_of: :short_loans
    belongs_to :relationship_officer
    

    def instalment_repayment(params) 
        instalment_status = 'paid'
        amount = 0
       loan = ShortLoan.find(params[:id])
       schedule = []
       if params[:short_loan][:full_payment] == "1"
            loan.loan_schedule.each do |element|
                if element.first.to_datetime.today?
                    element[1] = instalment_status
                end
                schedule << element
            end
        else
            schedule = loan.loan_schedule
        end
    
       amount = amount_paid(params[:short_loan],loan)
       update_hash = {loan_schedule: schedule, outstanding_loan_balance: update_outstanding_loan_balance(amount.to_i,loan)}
       loan.update(update_hash)
    end

    private 

        def initial_loan_balance
            self.initial_balance = self.instalment_amount * self.loan_duration
            self.outstanding_loan_balance = self.initial_balance
        end

        def generate_loan_schedule 
            loop_control = self.loan_duration
            date = self.due_date
            days = 7.days
            instalment = self.instalment_amount
            status = 'Not Paid'
            schedule = []
            schedule << [date,status,instalment]
            (loop_control -1).times do 
                date += days
                schedule << [date,status,instalment]
            end
            self.loan_schedule = schedule
        end

        def update_outstanding_loan_balance(amount,loan)
            balance = loan.outstanding_loan_balance
            balance -= amount
        end

        def amount_paid(payment_hash,loan)
            amount = 0
            if payment_hash[:full_payment] == "1"
                amount = loan.instalment_amount
            else
                amount = payment_hash[:amount]
            end
            amount
        end

end
