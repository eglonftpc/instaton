class User < ApplicationRecord
  validates :username,    presence: true, uniqueness: { case_sensitive: false }
  validates :last_name,   presence: true
  validates :first_name,  presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :images
  def full_name
    [first_name, last_name].join(' ')
  end
end
