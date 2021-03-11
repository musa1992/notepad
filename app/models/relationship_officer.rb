class RelationshipOfficer < ApplicationRecord
    require 'date'
    attr_accessor :activation_token
    before_save {self.email = email.downcase}
    before_create :create_activation_digest
    validates :name, presence: true, length: {minimum: 6, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 255},
              format: {with: VALID_EMAIL_REGEX},
              uniqueness: {case_sensitive: false}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}
    has_many :clients

    def RelationshipOfficer.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def RelationshipOfficer.new_token
        SecureRandom.urlsafe_base64
    end

    def authenticated? (attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    def activate
        update_attribute(:activated, true)
        update_attribute(:activated_at, Time.zone.now)
    end

    def send_activation_link
        RelationshipOfficerMailer.account_activation(self).deliver_now
    end
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

    private

      def create_activation_digest
        self.activation_token = RelationshipOfficer.new_token
        self.activation_digest = RelationshipOfficer.digest(activation_token)
      end
    
end
