class Client < ApplicationRecord
    before_save {self.status = 'active'}
    validates :name, presence: true, length: {minimum: 6, maximum: 50}
    validates :phone_no, presence: true, length: {is: 10}, uniqueness: true
    validate :valid_phone  #fix using regex
    validates :relationship_officer_id, presence: true

    belongs_to :relationship_officer
    has_many :short_loans, inverse_of: :client
    accepts_nested_attributes_for :short_loans

    def format_date(date)
        date.split(" ").first
    end

    def self.update_client_details(update_params)
        client = Client.find(update_params[:id])
        client_details = update_params[:client]
        client_details.each do |key, value|
            column = key
            case column

            when 'phone_no'
                client.update_columns(phone_no: value)

            when 'name'
                client.update_columns(name: value)
            end
        end
     end

     def initial_loan_balance
        self.installment_amount * self.loan_duration
     end

     



    private

     def valid_phone
         errors.add(:phone_no, "Invalid format,number should start with zero") if phone_no.split("").first != "0"
     end

    
end
