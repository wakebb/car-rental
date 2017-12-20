class User < ApplicationRecord
  #registration stuff
  #attr_accessible :username, :password, :password_confirmation, :email, :email_confirmation, :license, :cardinfo, :address

  #references
  has_many :bookings
  has_one :approval

  enum user_type: [:student, :corporate, :normal, :admin]

  #Validations
  #Username could be alpha numeric + _ and -
  validates :username, uniqueness: true, presence: true, length: {minimum: 8},
   format: {
     with: /\A[a-zA-Z0-9_-]+\z/,
    message: "only allows alpha numeric characters"
   }
  #password should be alpha numeric
  validates :password, length: {in: 6..20}, presence: true, confirmation: true,
    format: {
      with: /\A[a-zA-Z0-9!@#$%^&*_-]+\z/,
      message: "Characters allowed is alpha numric and _-!@#$%^&"
    }
  #email could be any email id.
  validates :email, uniqueness: true, presence: true, confirmation: true,
   format: {
     with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
     message: "email should be in format email@domain.com"
   }

   validates :cardinfo, presence:true, length: {in: 16..16},
   format: {
     with: /\A[0-9]+\z/,
     message: "credit card is not valid"
   }
  #  #validate credit card
  #  validate :validate_credit_card

   #validates the license number
   validates :license, uniqueness: true, presence: true, length: {in: 7..7},
   format: {
     with: /\A[a-zA-Z0-9]+\z/,
     message: "license number should be alpha numeric"
   }

   #validates address
   validates :address, presence: true

  validates_confirmation_of :password
  validates_confirmation_of :email


   def self.authenticate(username, submitted_password)
    user = User.find_by username: username
    return nil if user.nil?
    approval = Approval.find_by User_id: user.id
    puts approval.status
    return user if approval.status == "approved" and user.password == submitted_password
   end

   def validate_credit_card
     if !CreditCardValidator::Validator.valid?(:cardinfo.to_s)
       errors.add(:cardinfo.to_s, "is not valid.")
     end
   end
end
