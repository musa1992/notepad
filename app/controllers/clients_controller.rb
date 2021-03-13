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
      @client = current_user.search(params[:phone_no])
      if @client.nil?
        redirect_to request.referrer, notice: "Client not found"
      end
    end

    def update
        # @client = Client.find(params[:id])
        Client.update_client_details(params)
        respond_to do |format|
            format.js
        end
    end
    
    private

     def client_params
        params.require(:client).permit(:name,:phone_no,:due_date,:installment_amount,:loan_duration,:end_date)
     end

end
