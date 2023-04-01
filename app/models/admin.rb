class Admin < ApplicationRecord
    has_secure_password
    has_many :gyms

    validates :adminname, presence: true, uniqueness: true,length:{minimum:4}
    validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :password, presence: true, length: { minimum: 7 }
end
