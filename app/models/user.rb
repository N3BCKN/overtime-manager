class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_presence_of :first_name, :last_name, :phone_number

  validates_format_of :phone_number, with: PHONE_REGEX

  validates :phone_number, length: {is: 10}

  def full_name
	last_name.upcase + ", " + first_name.upcase
  end 
end
