class ShortLoansController < ApplicationController
    before_action :set_loan, only: %i[ show edit update destroy ]
    def update
        
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
end
