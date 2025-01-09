class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :password, presence: true, confirmation: true, if: -> { new_record? || changes[:encrypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:encrypted_password] }
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
  has_many :prototypes
  has_many :comments, dependent: :destroy
end