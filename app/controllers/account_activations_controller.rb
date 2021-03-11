class AccountActivationsController < ApplicationController

    def edit
        officer = RelationshipOfficer.find_by(email: params[:email])

        if officer && !officer.activated? && officer.authenticated?(:activation, params[:id])
            officer.activate
            log_in officer
            flash[:success] = "Account Activated"
            redirect_to home_path
        else
            flash[:danger] = "Invalid activation link"
            redirect_to signup_path
        end
    end
end
