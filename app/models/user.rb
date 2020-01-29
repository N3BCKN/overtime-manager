# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :audit_logs

  
  has_many :hands_associations, class_name: 'Hand'
  has_many :hands, through: :hands_associations

  PHONE_REGEX = /\A[0-9]*\Z/.freeze

  validates_presence_of :first_name, :last_name, :phone_number

  validates_format_of :phone_number, with: PHONE_REGEX

  validates :phone_number, length: { is: 10 }

  def full_name
    last_name.upcase + ', ' + first_name.upcase
  end
end
