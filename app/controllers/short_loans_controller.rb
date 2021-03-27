class ShortLoansController < ApplicationController
    
    def create

    end

    private 

    def loan_params
        params.require(:short_loan).permit(:loan_amount, :loan_duration, :instalment_amount, :due_date)
    end
end
