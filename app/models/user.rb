class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates :phone_number, uniqueness: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
