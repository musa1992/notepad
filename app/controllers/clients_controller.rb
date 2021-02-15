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

    private

     def client_params
        params.require(:client).permit(:name,:phone_no,:due_date,:installment_amount,:loan_duration,:end_date)
     end
end
