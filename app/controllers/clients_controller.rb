class ClientsController < ApplicationController
    def new
        @client = Client.new
    end

    def create
        @client = current_user.clients.build(client_params)
        if @client.save
            flash[:success] = "Created"
            redirect_to home_path
        else
            render 'new'
        end
    end

    def show
        
    end
    def client_information
        respond_to do |format|
            format.js {render :client_information}
        end
    end

    def loan_information
        respond_to do |format|
            format.js {render :loan_information}
        end
    end
    private

     def client_params
        params.require(:client).permit(:name,:phone_no,:due_date,:installment_amount,:loan_duration,:end_date)
     end
end
