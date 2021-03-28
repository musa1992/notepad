class ClientsController < ApplicationController


    def new
        @client = Client.new
        @client.short_loans.build
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

    def search
        @client = current_user.search(params[:phone_no])
        if @client.nil?
            redirect_to request.referrer, notice: "Client not found"
        else
            session[:client_id] = @client.id
            render 'show'
        end

    end

    def show

    end

    def update
        Client.update_client_details(params)
        respond_to do |format|
            @client = Client.find(params[:id])
            format.js
        end
    end

    def client_payment
        respond_to do |format|
            @client_id = session[:client_id]
            format.js
        end
    end
    
    private

     def client_params
        params.require(:client).permit(:name,:phone_no,short_loans_attributes:[:relationship_officer_id,:loan_amount,:instalment_amount,:loan_duration,:due_date])
     end

end
