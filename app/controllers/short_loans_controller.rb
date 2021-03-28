class ShortLoansController < ApplicationController
    before_action :set_loan, only: %i[ show edit update destroy ]
    def new 
        
    end
    def create
        
        @short_loan = ShortLoan.new(loan_params)

        if @short_loan.save
            redirect_to home_path
        else
            redirect_to request.referrer
        end
    end
    def update
        @loan.instalment_repayment(params)
        redirect_to home_path
    end

    def edit
        respond_to do |format|
            format.js
        end
    end

    private 
        def set_loan
            @loan = ShortLoan.find(params[:id])
        end

        def loan_params
            params.require(:short_loan).permit(:loan_amount, :loan_duration, :instalment_amount, :due_date,:relationship_officer_id,:client_id)
        end
end
