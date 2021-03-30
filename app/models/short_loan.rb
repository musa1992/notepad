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
        loan = ShortLoan.find(params[:id])
        amount = amount_paid(params[:short_loan],loan)
        schedule = loan.loan_schedule
        schedule.each_with_index do |element, index|
            if element.first.to_datetime.today?
                instalment = element[2].to_i
                if (instalment - amount).zero? || (instalment - amount).positive?
                    element[2] = instalment - amount
                else
                    schedule = overpayment(index,amount,schedule)
                end
            end
        end 
       update_hash = {loan_schedule: schedule, outstanding_loan_balance: update_outstanding_loan_balance(amount,loan)}
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
            amount.to_i
        end

        def overpayment(index,amount,schedule)

            until amount <= 0 do
                instalment = schedule[index][2].to_i
                if amount >= instalment
                    schedule[index][2] = 0
                else
                    schedule[index][2] = instalment - amount 
                end
                index += 1
                amount -= instalment
            end
            schedule     
        end

end
