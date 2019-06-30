class User < ApplicationRecord
    has_secure_password

    validates :email, {presence: true ,uniqueness: true}
    validates :name, {presence: true ,length: {maximum: 20}}
    validates :password, {presence: true}
    #validates :date, {presence: true}
    validates :gender, {presence: true}
end
