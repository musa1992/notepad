class RelationshipOfficer < ApplicationRecord
    require 'date'
    before_save {self.email = email.downcase}
    validates :name, presence: true, length: {minimum: 6, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    has_many :clients


    def loans_due
        @dues = []
        self.clients.each do |client|
            @dues << client if client.due_date == Date.today
        end
        @dues
    end

    def total_dues
        return 0 if loans_due.empty?
        loans_due.map{|client| client.installment_amount}.reduce(:+)
    end

    def client_count
        loans_due.count
    end

    def search(search)
        self.clients.find_by(phone_no: search)
    end
    
end
