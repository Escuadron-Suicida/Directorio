class Sector < ApplicationRecord
  has_many :business_sectors
  has_many :business, through: :business_sectors
end
