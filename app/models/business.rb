class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :business_sectors
  has_many :sectors, through: :business_sectors

  has_many :products, dependent: :delete_all

  validates :name, presence: true
end
